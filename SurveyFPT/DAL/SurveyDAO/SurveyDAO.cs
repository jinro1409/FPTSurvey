using SurveyFPT.Data;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL.SurveyDAO
{
    public class SurveyDAO : DbContext
    {
        private readonly SurveyMapper mapper;
        public SurveyDAO()
        {
            mapper = new SurveyMapper();
        }
        public Survey Read(int id)
        {
            Survey survey = null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSurveyByID",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@ID", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = id, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };



                
                cmd.Parameters.Add(param1);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    survey = mapper.SQLDataReadertoSurvey(sdr);

                    conn.Close();
                    break;

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

            return survey;
        }

        public Tuple<List<Survey>,int> FindAllSurveySearch(int page, int pagesize, string search, int categoryid)
        {
            List<Survey> surveys = new List<Survey>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllSurveySearch",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
       
                SqlParameter param3 = new SqlParameter
                {
                    ParameterName = "@page", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = page, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param4 = new SqlParameter
                {
                    ParameterName = "@pagesize", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = pagesize, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param5 = new SqlParameter
                {
                    ParameterName = "@search", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Size = 3999,
                    Value = search, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param6 = new SqlParameter
                {
                    ParameterName = "@categoryid", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = categoryid, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                cmd.Parameters.AddWithValue("@total_record", SqlDbType.Int);
                cmd.Parameters["@total_record"].Direction = ParameterDirection.Output;



                
                cmd.Parameters.Add(param3);
                cmd.Parameters.Add(param4);
                cmd.Parameters.Add(param5);
                cmd.Parameters.Add(param6);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    Survey survey = new Survey();
                    survey = mapper.SQLDataReadertoSurvey(sdr);
                    surveys.Add(survey);
                }
                sdr.Close();
                int totalRecord = Convert.ToInt32(cmd.Parameters["@total_record"].Value);
                return new Tuple<List<Survey>, int>(surveys, totalRecord);
            }
            catch (Exception ex)
            {
                Console.WriteLine("FindAllSurveySearch " + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();
            }
        }

        public Tuple<List<SurveyStatisticDTO>, int> FindAllSurveyResultSearch(int page, int pagesize, string search, int categoryid)
        {
            List<SurveyStatisticDTO> surveys = new List<SurveyStatisticDTO>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "[spGetAllSurveyStatistic]",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

                SqlParameter param3 = new SqlParameter
                {
                    ParameterName = "@page", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = page, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param4 = new SqlParameter
                {
                    ParameterName = "@pagesize", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = pagesize, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param5 = new SqlParameter
                {
                    ParameterName = "@search", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Size = 3999,
                    Value = search, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param6 = new SqlParameter
                {
                    ParameterName = "@categoryid", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = categoryid, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                cmd.Parameters.AddWithValue("@total_record", SqlDbType.Int);
                cmd.Parameters["@total_record"].Direction = ParameterDirection.Output;

                cmd.Parameters.Add(param3);
                cmd.Parameters.Add(param4);
                cmd.Parameters.Add(param5);
                cmd.Parameters.Add(param6);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                  
                    var survey = mapper.SQLDataReadertoSurveySatistic(sdr);
                    surveys.Add(survey);
                }
                sdr.Close();
                int totalRecord = Convert.ToInt32(cmd.Parameters["@total_record"].Value);
                return new Tuple<List<SurveyStatisticDTO>, int>(surveys, totalRecord);
            }
            catch (Exception ex)
            {
                Console.WriteLine("FindAllSurveySearch " + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();
            }
        }

        public List<Survey> FindAllSurvey()
        {
            List<Survey> surveys = new List<Survey>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllSurvey",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };




                
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    Survey survey = new Survey();
                    survey = mapper.SQLDataReadertoSurvey(sdr);

                    surveys.Add(survey);

                }
                conn.Close();
            }
            catch (Exception ex)
            {


                Console.WriteLine("FindAllSurvey " + ex.Message);

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return surveys;
        }

        public Tuple<List<Survey>,int> FindAllSurveyByEmailSearch(int isResponse, string email, int page, int pagesize, string search)
        {
            List<Survey> surveys = new List<Survey>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllSurveyByEmailSearch",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@is_response", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = isResponse, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@email", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Size = 100,
                    Value = email, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                SqlParameter param3 = new SqlParameter
                {
                    ParameterName = "@page", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = page, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param4 = new SqlParameter
                {
                    ParameterName = "@pagesize", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = pagesize, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                SqlParameter param5 = new SqlParameter
                {
                    ParameterName = "@search", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Size = 3999,
                    Value = search, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };
                cmd.Parameters.AddWithValue("@total_record", SqlDbType.Int);
                cmd.Parameters["@total_record"].Direction = ParameterDirection.Output;

                
                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                cmd.Parameters.Add(param3);
                cmd.Parameters.Add(param4);
                cmd.Parameters.Add(param5);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    Survey survey = new Survey();
                    survey = mapper.SQLDataReadertoSurvey(sdr);

                    surveys.Add(survey);

                }
                
                sdr.Close();
                int totalRecord = Convert.ToInt32(cmd.Parameters["@total_record"].Value);
                return new Tuple<List<Survey>, int>(surveys, totalRecord);
            }
            catch (Exception ex)
            {


                Console.WriteLine("FindAllSurveyByEmail " + ex.Message);

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return null;
        }


        /// <summary>
        /// Get All survey by email 
        /// </summary>
        /// <param name="isResponse">1 is responsed, 0 else </param>
        /// <returns></returns>
        public List<Survey> FindAllSurveyByEmail(int isResponse, string email)
        {
            List<Survey> surveys = new List<Survey>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllSurveyByEmail",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@is_response", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.Int, //Data Type of Parameter
                    Value = isResponse, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };

                SqlParameter param2 = new SqlParameter
                {
                    ParameterName = "@email", //Parameter name defined in stored procedure
                    SqlDbType = SqlDbType.NVarChar, //Data Type of Parameter
                    Size = 100,
                    Value = email, //Value passes to the paramtere
                    Direction = ParameterDirection.Input //Specify the parameter as input
                };


                
                cmd.Parameters.Add(param1);
                cmd.Parameters.Add(param2);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    Survey survey = new Survey();
                    survey = new SurveyMapper().SQLDataReadertoSurvey(sdr);

                    surveys.Add(survey);

                }
                conn.Close();
            }
            catch (Exception ex)
            {


                Console.WriteLine("FindAllSurveyByEmail " + ex.Message);

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return surveys;
        }
        public int Create(SurveyCreateDTO survey)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertSurvey",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@name", survey.Name);
                cmd.Parameters.AddWithValue("@code", survey.Code);
                if (string.IsNullOrEmpty(survey.Description))
                    cmd.Parameters.AddWithValue("@description", DBNull.Value);
                else 
                    cmd.Parameters.AddWithValue("@description", survey.Description);
                cmd.Parameters.AddWithValue("@opentime", survey.OpenTime);
                cmd.Parameters.AddWithValue("@closetime", survey.CloseTime);
                cmd.Parameters.AddWithValue("@survey_category_id", survey.SurveyCategory.ID);
                cmd.Parameters.AddWithValue("@create_id", survey.CreatedBy);
                cmd.Parameters.AddWithValue("@is_require", survey.IsRequire);
                cmd.Parameters.AddWithValue("@is_score", survey.IsScoreTaken);
                cmd.Parameters.AddWithValue("@is_public", survey.IsPublish);
                cmd.Parameters.AddWithValue("@is_changing_allow", survey.IsAllowChanging);
                if (string.IsNullOrEmpty(survey.BackgroundImage))
                    cmd.Parameters.AddWithValue("@background_image", DBNull.Value);
                else cmd.Parameters.AddWithValue("@background_image", survey.BackgroundImage);
                SqlParameter outParameter = new SqlParameter
                {
                    ParameterName = "@id", //Parameter name defined in stored procedure
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
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

        }
        public List<SurveyStatisticDTO> Statistic()
        {
            List<SurveyStatisticDTO> statisticDTOs = new List<SurveyStatisticDTO>();
            SurveyStatisticDTO survey;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetAllSurveyStatistic",
                    //"spGetTextStatistic",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
             
                
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    survey = mapper.SQLDataReadertoSurveySatistic(sdr);
                    statisticDTOs.Add(survey);

                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("ReadOnebyCode  fail" + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return statisticDTOs;
        }
        public SurveyStatisticDTO Statistic(int id)
        {
            SurveyStatisticDTO survey=null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSurveyStatistic",
                    //"spGetTextStatistic",
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
                    survey = mapper.SQLDataReadertoSurveySatistic(sdr);
                    break;
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("ReadOnebyCode  fail" + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return survey;
        }
        public int Delete(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spDeleteSurvey",
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
        public int Update(SurveyCreateDTO survey)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateSurvey",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@id", survey.ID);
                cmd.Parameters.AddWithValue("@name", survey.Name);
                
                if (string.IsNullOrEmpty(survey.Description))
                    cmd.Parameters.AddWithValue("@description", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@description", survey.Description);
                cmd.Parameters.AddWithValue("@open_time", survey.OpenTime);
                cmd.Parameters.AddWithValue("@close_time", survey.CloseTime);
                cmd.Parameters.AddWithValue("@sc_id", survey.SurveyCategory.ID);
                cmd.Parameters.AddWithValue("@update_id", survey.UpdatedBY);
                cmd.Parameters.AddWithValue("@is_require", survey.IsRequire);
                cmd.Parameters.AddWithValue("@is_score_taken", survey.IsScoreTaken);
                cmd.Parameters.AddWithValue("@is_public", survey.IsPublish);
                cmd.Parameters.AddWithValue("@is_changing", survey.IsAllowChanging);
                if (string.IsNullOrEmpty(survey.BackgroundImage))
                    cmd.Parameters.AddWithValue("@image", DBNull.Value);
                else cmd.Parameters.AddWithValue("@image", survey.BackgroundImage);
               
                //add the parameter to the SqlCommand object

                
                int result=cmd.ExecuteNonQuery();
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;
            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

        }
    }
}