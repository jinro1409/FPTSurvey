using SurveyFPT.Data;
using SurveyFPT.DTO;
using SurveyFPT.DTO.Responsed;
using SurveyFPT.Mapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class SurveyResponeseDAO : DbContext
    {

        public int Read(int id, string email)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spCheckSubmitedResponse",
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
                while (sdr.Read())
                {
                    int.TryParse(sdr["id"].ToString(), out int rs);
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
        public List<ResponseSurveyDTO> Read(int id)
        {
            List<ResponseSurveyDTO> list = new List<ResponseSurveyDTO>();
            ResponsedSurveyMapper mapper = new ResponsedSurveyMapper();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetResponsesBySurveyID",
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
                    list.Add(mapper.SQLDataReadertoResponseSurvey(sdr));
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
        public ResponseSurveyDTO ReadIndividual(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetInforByID",
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
                    int.TryParse(sdr["survey_id"].ToString(), out int rs);
                    string email=sdr["email"].ToString();
                    conn.Close();

                    return new ResponseSurveyDTO
                    {
                        ID = id,
                        Email = email,
                        Survey=new SurveyDTO { ID = rs },
                    };
                }
                conn.Close();
                return null;
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
        public List<ResponsedAnswerDTO> ReadtoExport(int id)
        {
            List<ResponsedAnswerDTO> list =null;
            ResponsedSurveyMapper mapper = new ResponsedSurveyMapper();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllSurveyResponseAnswer",
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
               list=mapper.SQLDataReadertoResponsedAnsewer(sdr);
               
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

    }
}