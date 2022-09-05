using SurveyFPT.Data;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL.UserDAO
{
    public class UserDAO : DbContext
    {
        readonly DAO dao = new DAO();
        public List<Account> FindAllUser(int page, int pagesize)
        {
            List<Account> list = new List<Account>();
            try
            {
                string sql = " select * from "
+ "( select u.id as uid, u.name as uname, mail, r.id as rid, r.name as rname,"
+ "ROW_NUMBER() over(order by u.id) as row_num "
+ "from [Role] r inner join [User] u on r.id = u.role_id) as t "
+ "where t.row_num between ((" + page + "-1)*" + pagesize + "+1) and (" + page + "*" + pagesize + ")";
                DataTable dt = dao.excuteQuery(sql);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Account a = new Account
                    {
                        Id = int.Parse(dt.Rows[i]["uid"].ToString()),
                        Mail = dt.Rows[i]["mail"].ToString(),
                        Name = dt.Rows[i]["uname"].ToString()
                    };

                    Role r = new Role
                    {
                        Id = int.Parse(dt.Rows[i]["rid"].ToString()),
                        Name = dt.Rows[i]["rname"].ToString()
                    };
                    a.Role = r;
                    list.Add(a);
                }

                return list;
            }
            catch (Exception ex)
            {
                Console.WriteLine("findAllUser" + ex.Message);
            }
            return null;
        }





        public void SaveAccount(Account a)
        {
            try
            {
                string sql = "INSERT INTO [dbo].[User]\n" +
"           ([name]\n" +
"           ,[mail]\n" +
"           ,[role_id])\n" +
"     VALUES\n" +
"           ('" + a.Name + "'\n" +
"           ,'" + a.Mail + "'\n" +
"           ,2)";

                dao.ExcuteNonQuery(sql);

            }
            catch (Exception ex)
            {
                Console.WriteLine("insertAccount" + ex.Message);
            }
        }
        public Account FindUserByEmail(string email)
        {
                try
                {
                    SqlCommand cmd = new SqlCommand("spFindUserByEmail", dao.cnn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@email", email);
                    SqlDataReader sdr = cmd.ExecuteReader();

                    while (sdr.Read())
                    {
                        Account a = new Account
                        {
                            Id = int.Parse(sdr["uid"].ToString()),
                            Mail = sdr["email"].ToString(),
                            Name = sdr["uname"].ToString(),
                            Active = (bool)sdr["ustatus"]
                        };

                        Role r = new Role
                        {
                            Id = int.Parse(sdr["rid"].ToString()),
                            Name = sdr["rname"].ToString()
                        };
                        a.Role = r;
                        return a;
                    }
                    
            }
            catch (Exception ex)
            {
                Console.WriteLine("FindUserByEmail" + ex.Message);
            }
            return null;
        }


        public Tuple<List<Account>,int> FindAllUserProcedure(int page, int pagesize,string search)
        {
            int totalRecord ;
            List<Account> list = new List<Account>();
            try
            {
                SqlCommand cmd = new SqlCommand("findAll_User", dao.cnn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@page", page);
                cmd.Parameters.AddWithValue("@pagesize", pagesize);
                cmd.Parameters.AddWithValue("@search", search);
                cmd.Parameters.AddWithValue("@total_record", SqlDbType.Int);
                cmd.Parameters["@total_record"].Direction = ParameterDirection.Output;
                SqlDataReader sdr = cmd.ExecuteReader();

                
                while(sdr.Read())
                {
                    Account a = new Account
                    {
                        Id = int.Parse(sdr["uid"].ToString()),
                        Mail = sdr["email"].ToString(),
                        Name = sdr["uname"].ToString(),
                        Active = (bool)sdr["status"]
                    };

                    Role r = new Role
                    {
                        Id = int.Parse(sdr["rid"].ToString()),
                        Name = sdr["rname"].ToString()
                    };
                    a.Role = r;
                    

                    list.Add(a);
                }
                sdr.Close();
                totalRecord = Convert.ToInt32(cmd.Parameters["@total_record"].Value);
                return new Tuple<List<Account>, int>(list,totalRecord);
            }
            catch (Exception ex)
            {
                Console.WriteLine("findAllUser" + ex.Message);
            }
            return null;
        }


        public Tuple<Account, string> SaveUserProcedure(Account a,int assign,Account admin)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("save_User", dao.cnn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@mail", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Value = a.Mail, //Value passes to the paramtere
                    Size = 3999,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param7 = new SqlParameter
                {
                    ParameterName = "@name", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Value = a.Name, //Value passes to the paramtere
                    Size = 3999,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@role_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = a.Role.Id, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param3 = new SqlParameter
                {
                    ParameterName = "@active", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Bit, //Data Type of Parameter
                    Value = a.Active, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param4 = new SqlParameter
                {
                    ParameterName = "@assign", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = assign, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param5 = new SqlParameter
                {
                    ParameterName = "@create_by", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = admin.Id, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param6 = new SqlParameter
                {
                    ParameterName = "@modify_by", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = admin.Id, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                //cmd.Parameters.AddWithValue("@mail", a.Mail);
                //cmd.Parameters.AddWithValue("@role_id", a.Role.Id);
                //cmd.Parameters.AddWithValue("@active", a.Active);
                //cmd.Parameters.AddWithValue("@assign", assign);
                //cmd.Parameters.AddWithValue("@create_by", admin.Id);
                //cmd.Parameters.AddWithValue("@modify_by", admin.Id);

                cmd.Parameters.AddWithValue("@ok", SqlDbType.Int);
                cmd.Parameters["@ok"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                cmd.Parameters.Add(param3);
                cmd.Parameters.Add(param4);
                cmd.Parameters.Add(param5);
                cmd.Parameters.Add(param6);
                cmd.Parameters.Add(param7);
                cmd.ExecuteNonQuery();
                string ok = Convert.ToString(cmd.Parameters["@ok"].Value);
                return new Tuple<Account, string>(a, ok);
            }
            catch (Exception ex)
            {
                Console.WriteLine("saveUserProcedure" + ex.Message);
                throw;
            }
            
        }

        

        public User FindUserByID(int id)
        {
            
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spFindUserByID",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = id, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };



              
                cmd.Parameters.Add(param1);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    User us = new UserMapper().SQLDataReadertoUser(sdr);
                    return us;
                   

                }

            }
            catch (Exception ex)
            {


                Console.WriteLine("ReadOnebyCode Procduct fail" + ex.Message);

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return null;
        }
    }
}