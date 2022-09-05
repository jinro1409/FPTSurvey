using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL.RoleDAO
{
    public class RoleDAO
    {
        readonly DAO dao = new DAO();

        /// <summary>
        /// Find Role by id
        /// </summary>
        /// <param name="id">id of role</param>
        /// <returns>exited = Role, else null</returns>
        public Role FindRoleById(int id)
        {

            String sql = "select * from role where id = " + id + "";
            DataTable dt = dao.excuteQuery(sql);
            if(dt.Rows.Count > 0)
            {

                Role p = new Role
                {
                    Id = (int.Parse(dt.Rows[0]["id"].ToString())),
                    Name = (string)dt.Rows[0]["role_name"].ToString()
                };

                return p;

            }
            return null;
        }


        public List<Role> FindAllRoleProcedure()
        {
            List<Role> list = new List<Role>();
            try
            {
                SqlCommand cmd = new SqlCommand("findAll_Role", dao.cnn)
                {
                    CommandType = CommandType.StoredProcedure
                };


                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {


                    Role r = new Role
                    {
                        Id = int.Parse(sdr["id"].ToString()),
                        Name = sdr["role_name"].ToString()
                    };


                    list.Add(r);
                }

                return list;
            }
            catch (Exception ex)
            {
                Console.WriteLine("findAllUserProcedure" + ex.Message);
            }
            return null;
        }
    }
}