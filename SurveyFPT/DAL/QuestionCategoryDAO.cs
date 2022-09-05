using SurveyFPT.Data;
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
    public class QuestionCategoryDAO : DbContext
    {
        public QuestionCategory Read(int id)
        {
            QuestionCategory survey = null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetQuestionCategoryById",
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
                    survey = new QuestionCategoryMapper().SQLDataReadertoQuestionCategory(sdr);

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
    }
}