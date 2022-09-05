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
    public class TextAnswerDAO : DbContext
    {

        public TextAnswer Read(int id)
        {
            TextAnswer survey = null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetTextAnswerbyQuestionID",
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
                    survey = new TextAnswerMapper().SQLDataReadertoTextAnswer(sdr);
                    conn.Close();
                    break;

                }

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
        public int Create(TextAnswerCreateDTO text, int questionID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertTextQ",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@question_id", questionID);
                if (string.IsNullOrEmpty(text.Label))
                    cmd.Parameters.AddWithValue("@label", DBNull.Value);
                else 
                    cmd.Parameters.AddWithValue("@label", text.Label);
                cmd.Parameters.AddWithValue("@create_id", text.CreatedBy);
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
        public List<TextStatisticDTO> Statistic(int id,bool isOther)
        {
            List<TextStatisticDTO> textStatisticDTOs=new List<TextStatisticDTO>();
            TextStatisticDTO text;
            int index = 0;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = isOther ? "spGetOtherChoiceStatistic" : "spGetTextStatistic",
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
                    text = new TextAnswerMapper().SQLDataReadertoTextSatistcDTO(sdr,index);
                    textStatisticDTOs.Add(text);

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

            return textStatisticDTOs;
        }
        public int Delete(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spDeleteTextAnswer",
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
        public int Update(TextAnswerCreateDTO text)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateTextAnswer",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@id", text.ID);
                if (string.IsNullOrEmpty(text.Label))
                    cmd.Parameters.AddWithValue("@label", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@label", text.Label);
                cmd.Parameters.AddWithValue("@update_id", text.UpdatedBY);
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