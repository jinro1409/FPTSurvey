using SurveyFPT.Data;
using SurveyFPT.DTO;
using SurveyFPT.Mapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class ResponesedTextAnswerDAO : DbContext
    {
        public int Create(string text, int surveyId,int textanswerId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertResponseText",
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
                    ParameterName = "@rsurvey_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = surveyId,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param3 = new SqlParameter
                {
                    ParameterName = "@text_answer_id", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = textanswerId,
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                cmd.Parameters.Add(param3);

               
                int result=cmd.ExecuteNonQuery();
                conn.Close();
                
                return result;
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

        }

        public List<ResponseTextAnswerDTO> Read(int id)
        {

            List<ResponseTextAnswerDTO> list = new List<ResponseTextAnswerDTO>();
            ResponseTextAnswerDTO response;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSubmitedTextAnswer",
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
                TextResponseMapper mapper = new TextResponseMapper();
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
        public int Delete(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "[spDeleteResponsedText]",
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

        public int Update(string text, int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateResponseTextAnswer",
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
    }

}