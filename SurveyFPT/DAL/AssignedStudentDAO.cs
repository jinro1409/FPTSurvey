using SurveyFPT.Data;
using SurveyFPT.DTO.OutPutDTO;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq.Mapping;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Web;

namespace SurveyFPT.DAL
{
    public class AssignedStudentDAO : DbContext
    {
        public int Check(int id, string email)
        {

            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSurveyAccessPermission",
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
                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@email", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.VarChar, //Data Type of Parameter
                    Value = email, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };



                
                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                SqlDataReader sdr = cmd.ExecuteReader();
                int rs;
                while (sdr.Read())
                {
                    int.TryParse(sdr["id"].ToString(), out rs);
                    conn.Close();
                    return rs;
                }
                conn.Close();

            }
            catch (Exception ex)
            {


                Console.WriteLine("ReadOnebyCode Procduct fail" + ex.Message);
                throw;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return 0;
        }

        public int assignStudentToSurvey(AssignedStudent ass, int survey_id, int admin_id)
        {
            try
            {

                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "[saveAssignStudent]",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@email", ass.Email.ToLower());
                cmd.Parameters.AddWithValue("@survey_id", survey_id);
                cmd.Parameters.AddWithValue("@status", 1);
                cmd.Parameters.AddWithValue("@created_by", admin_id);
                

                
                
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("assignStudentToSurvey" + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }
        }

        public List<AssignedStudent> findAllAssignBySurveyID(int survey_id)
        {
            List<AssignedStudent> assigneds = new List<AssignedStudent>(); 
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllAssignBySurveyID",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@survey_id", survey_id);
                
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    AssignedStudent assigned = new AssignedStudent();
                    assigned.Email = Convert.ToString(sdr["Email"]);
                    assigned.SurveyID = Convert.ToInt32(sdr["survey_id"]);
                    assigneds.Add(assigned);

                }
                conn.Close();
            }
            catch (Exception ex)
            {


                Console.WriteLine("findAllSurveyCategory Procduct fail" + ex.Message);
                throw;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return assigneds;
        }
        public List<AssignedRequireSurveyDTO> Read(string email)
        {
            List<AssignedRequireSurveyDTO> assigneds = new List<AssignedRequireSurveyDTO>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "[spGetAllAssignByEmail]",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@email", email);



                
                SqlDataReader sdr = cmd.ExecuteReader();
                AssignedRequireSurveyDTO assigned;
                while (sdr.Read())
                {
                    assigned = new AssignedRequireSurveyDTO();
                    assigned.Name = Convert.ToString(sdr["name"]);
                    assigned.Code = Convert.ToString(sdr["code"]);

                    assigneds.Add(assigned);


                }
                conn.Close();
            }
            catch (Exception ex)
            {


                Console.WriteLine("findAllSurveyCategory Procduct fail" + ex.Message);
                throw;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return assigneds;
        }

        void BulkInsertAll<T>(List<T> entities)
        {
            //var conn = (SqlConnection) conn;

            Type t = typeof(T);
            var tableAttribute = (TableAttribute)t.GetCustomAttributes(typeof(TableAttribute), false).Single();
            var bulkCopy = new SqlBulkCopy(conn) { DestinationTableName = tableAttribute.Name };
            var properties = t.GetMembers().Where(p =>
            {
                var columnAttribute = Attribute.GetCustomAttribute(p, typeof(ColumnAttribute)) as ColumnAttribute;
                if (columnAttribute != null) return true;
                return false;
            }).ToArray();
            var table = new DataTable();
            foreach (var property in properties)
            {
                Type memberType = null;

                switch (property)
                {
                    case PropertyInfo pi:
                        memberType = pi.PropertyType;
                        break;
                    case FieldInfo fi:
                        memberType = fi.FieldType;
                        break;
                    default:
                        throw new InvalidOperationException();
                }

                if (memberType.IsGenericType && memberType.GetGenericTypeDefinition() == typeof(Nullable<>))
                {
                    memberType = Nullable.GetUnderlyingType(memberType);
                }
                table.Columns.Add(new DataColumn(property.Name, memberType));
            }
            // https://stackoverflow.com/a/50995201/89176
            table.Columns.Cast<DataColumn>().ToList().ForEach(x =>
                bulkCopy.ColumnMappings.Add(new SqlBulkCopyColumnMapping(x.ColumnName, x.ColumnName)));

            foreach (var entity in entities)
            {
                var cols = properties.Select(property =>
                {
                    switch (property)
                    {
                        case FieldInfo fi:
                            return fi.GetValue(entity) ?? DBNull.Value;
                        case PropertyInfo pi:
                            return pi.GetValue(entity) ?? DBNull.Value;
                        default:
                            throw new InvalidOperationException();
                    }
                }).ToArray();
                table.Rows.Add(cols);
            }
            if (conn.State != ConnectionState.Open)
                
            bulkCopy.BulkCopyTimeout = 0;
            bulkCopy.WriteToServer(table);
            conn.Close();
        }

        public int assignStudentToSurveyBulk<T>(List<T> items)
        {
            try
            {
                BulkInsertAll(items);
                return 1;
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                return -1;
            }
        }
    }
}