using SurveyFPT.Data;
using SurveyFPT.DTO.InputDTO;
using SurveyFPT.DTO.StatisticDTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace SurveyFPT.DAL
{
    public class LinearScaleAnswerDAO : DbContext
    {
        private readonly LinearScaleAnswerMapper mapper;
        public LinearScaleAnswerDAO()
        {
            mapper=new LinearScaleAnswerMapper();
        }
        public List<LinearScaleAnswer> Read(int id)
        {
            List<LinearScaleAnswer> list = new List<LinearScaleAnswer>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetLinearScaleByQuestionId",
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
                    LinearScaleAnswer linearScaleAnswer =mapper.SQLDataReadertoLinearScaleAnswer(sdr);
                    list.Add(linearScaleAnswer);

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
        public int Create(LinearScaleCreateDTO choice, int questionID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertLinear",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@question_id", questionID);
                cmd.Parameters.AddWithValue("@label", choice.ScaleLabel);
                cmd.Parameters.AddWithValue("@create_id", choice.CreatedBy);
                cmd.Parameters.AddWithValue("@number", choice.ScaleNumber);
                //add the parameter to the SqlCommand object

                
                int result = cmd.ExecuteNonQuery();
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
        public List<LinearScaleStatisticDTO> Statistic(int id)
        {
            List<LinearScaleStatisticDTO> statisticDTOs = new List<LinearScaleStatisticDTO>();
            LinearScaleStatisticDTO choice;
            int index = 0;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetLinearStatistic",
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
                    index++;
                    choice = mapper.SQLDataReadertoLinearScaleStatisticDTO(sdr, index);
                    statisticDTOs.Add(choice);

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
        public int Delete(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spDeleteLinearScale",
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
        public int Update(LinearScaleCreateDTO choice)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateLinearScale",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@id", choice.ID);
                cmd.Parameters.AddWithValue("@label", choice.ScaleLabel);
                cmd.Parameters.AddWithValue("@update_id", choice.UpdatedBY);
                //add the parameter to the SqlCommand object

                
                int result = cmd.ExecuteNonQuery();
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