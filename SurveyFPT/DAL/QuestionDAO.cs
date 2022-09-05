using SurveyFPT.Data;
using SurveyFPT.DTO.InputDTO;
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
    public class QuestionDAO : DbContext
    {
        public List<Question> Read(int id)
        {
            List<Question> list = new List<Question>();
            Question Question = null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetQuestionBySectionId",
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
                    Question = new QuestionMapper().SQLDataReadertoQuestion(sdr);
                    list.Add(Question);

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
        public int Create(QuestionCreateDTO question, int sectionID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertQuestion",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@section_id", sectionID);
                if (string.IsNullOrEmpty(question.Description))
                    cmd.Parameters.AddWithValue("@description", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@description", question.Description);
                cmd.Parameters.AddWithValue("@create_id", question.CreatedBy);
                cmd.Parameters.AddWithValue("@qc_id", question.QuestionCategory.ID);
                cmd.Parameters.AddWithValue("@order", question.Order);
                cmd.Parameters.AddWithValue("@question", question.QuestionLabel);
                cmd.Parameters.AddWithValue("@require", question.IsRequire);
                cmd.Parameters.AddWithValue("@point_scale", question.PointScale);
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
        public int Delete(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spDeleteQuestion",
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
        public int Update(QuestionCreateDTO question)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateQuestion",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@id", question.ID);
                if (string.IsNullOrEmpty(question.Description))
                    cmd.Parameters.AddWithValue("@description", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@description", question.Description);
                cmd.Parameters.AddWithValue("@update_id", question.UpdatedBY);
                cmd.Parameters.AddWithValue("@qc_id", question.QuestionCategory.ID);
                cmd.Parameters.AddWithValue("@order", question.Order);
                cmd.Parameters.AddWithValue("@question", question.QuestionLabel);
                cmd.Parameters.AddWithValue("@is_require", question.IsRequire);
                cmd.Parameters.AddWithValue("@point_scale", question.PointScale);
               
                //add the parameter to the SqlCommand object

                
                int result=  cmd.ExecuteNonQuery();
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