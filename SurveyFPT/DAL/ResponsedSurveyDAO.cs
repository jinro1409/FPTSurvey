using SurveyFPT.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class ResponsedSurveyDAO : DbContext
    {
        public int Create(string email,int surveyId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertSurveyResponse",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@email", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Value = email,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = surveyId,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                SqlParameter outParameter = new SqlParameter
                {
                    ParameterName = "@rsurvey_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Direction = ParameterDirection.Output //Specify the parameter as ouput
                };
                //add the parameter to the SqlCommand object
                cmd.Parameters.Add(outParameter);

                
                cmd.ExecuteNonQuery();

                int.TryParse(outParameter.Value.ToString(), out int result);
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine( ex.Message);
                throw;
            }
            
        }
    }
}