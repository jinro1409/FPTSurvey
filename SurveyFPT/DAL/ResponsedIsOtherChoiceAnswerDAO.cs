using SurveyFPT.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class ResponsedIsOtherChoiceAnswerDAO : DbContext
    {
        public int Create(int responechoice, string response)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertOtherChoiceTextResponse",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@rsurvey_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = responechoice,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@text", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Value = response,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);

                
                int result = cmd.ExecuteNonQuery();
                conn.Close();

                return result;
            }
            catch (Exception)
            {
                throw;
            }

        }
        public int Update(string text, int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateResponseIsOtherChoiceAnswer",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@response", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Value = text,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = id,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);

                
                int result = cmd.ExecuteNonQuery();
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {


                Console.WriteLine("Update " + ex.Message);
               throw;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

        }
        public int Delete(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spDeleteResponseIsOtherChoiceAnswer",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param = new SqlParameter
                {
                    ParameterName = "@id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = id,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                cmd.Parameters.Add(param);
                
                int result = cmd.ExecuteNonQuery();
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Delete " + ex.Message);
                throw;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }
        }
    }
}