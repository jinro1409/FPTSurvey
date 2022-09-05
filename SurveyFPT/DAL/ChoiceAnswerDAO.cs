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

namespace SurveyFPT.DAL
{
    public class ChoiceAnswerDAO : DbContext
    {
        private readonly ChoiceAnswerMapper mapper;
        public ChoiceAnswerDAO()
        {
            mapper = new ChoiceAnswerMapper();
        }
        public List<ChoiceAnswer> Read(int id)
        {

            List<ChoiceAnswer> list = new List<ChoiceAnswer>();
            ChoiceAnswer choiceAnswer;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetChoiceByQuestionID",
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
                    choiceAnswer = mapper.SQLDataReadertoChoiceAnswer(sdr);
                    list.Add(choiceAnswer);

                }
                conn.Close();

            }
            catch (Exception ex)
            {


                Console.WriteLine("ReadOnebyCode Procduct fail" + ex.Message);
                return null;

            }
            finally
            {
                if (conn.State == ConnectionState.Open) conn.Close();

            }

            return list;
        }
        public int Create(ChoiceCreateDTO choice, int questionID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertChoice",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@question_id", questionID);
                cmd.Parameters.AddWithValue("@label", choice.Label);
                cmd.Parameters.AddWithValue("@create_id", choice.CreatedBy);
                cmd.Parameters.AddWithValue("@is_other", choice.IsOtherChoice);
                cmd.Parameters.AddWithValue("@order", choice.Order);

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
        public List<ChoiceStatisticDTO> Statistic(int id)
        {
            List<ChoiceStatisticDTO> statisticDTOs = new List<ChoiceStatisticDTO>();
            ChoiceStatisticDTO choice;
            int index = 0;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetChoiceStatistic",
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
                    choice = mapper.SQLDataReadertoChoiceStatistic(sdr, index);
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
                    CommandText = "spDeleteChoice",
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
        public int Update(ChoiceCreateDTO choice)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateChoice",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@id",choice.ID);
                cmd.Parameters.AddWithValue("@label", choice.Label);
                cmd.Parameters.AddWithValue("@update_id", choice.UpdatedBY);
                cmd.Parameters.AddWithValue("@order", choice.Order);

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