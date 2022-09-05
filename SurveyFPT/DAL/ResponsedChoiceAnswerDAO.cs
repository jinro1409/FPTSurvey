using SurveyFPT.Data;
using SurveyFPT.DTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class ResponsedChoiceAnswerDAO : DbContext
    {
        public int Create(int choiceId, int surveyId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertChoiceResponse",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@choice_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = choiceId,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@rsurvey_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = surveyId,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                SqlParameter outParameter = new SqlParameter
                {
                    ParameterName = "@Id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Direction = ParameterDirection.Output //Specify the parameter as ouput
                };
                //add the parameter to the SqlCommand object
                cmd.Parameters.Add(outParameter);

                
                cmd.ExecuteNonQuery();
                conn.Close();
                int.TryParse(outParameter.Value.ToString(), out int result);
                return result;
            }
            catch (Exception)
            {
                throw;
            }

        }
        public List<ResponseChoiceAnswerDTO> Read(int id)
        {

            List<ResponseChoiceAnswerDTO> list = new List<ResponseChoiceAnswerDTO>();
            ResponseChoiceAnswerDTO response;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSubmitedChoiceAnswer",
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
                ReponseChoiceMapper mapper = new ReponseChoiceMapper();
                while (sdr.Read())
                {
                    response = mapper.fromSDR(sdr);
                    // section = new SectionMapper().SQLDataReadertoSection(sdr);
                    //list.Add(section);
                    list.Add(response);

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

            return list;

        }
        public int Update(int choiceid, int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateResponseChoiceAnswer",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@choice_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Value = choiceid,
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
                    CommandText = "spDeleteResponseChoiceAnswer",
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
                return 0;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }
        }
    }
}