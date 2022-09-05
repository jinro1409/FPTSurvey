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
    public class SectionDAO : DbContext
    {
        public List<Section> Read(int id)
        {
            List<Section> list = new List<Section>();
            Section section = null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSectionsBySurveyId",
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
                    section = new SectionMapper().SQLDataReadertoSection(sdr);
                    list.Add(section);
                    
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
        public int Create(SectionCreateDTO section,int surveyID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spInsertSection",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@name", section.Name);
                if (string.IsNullOrEmpty(section.Description))
                    cmd.Parameters.AddWithValue("@description", DBNull.Value);
                else 
                    cmd.Parameters.AddWithValue("@description", section.Description);
                cmd.Parameters.AddWithValue("@create_id", section.CreatedBy);
                cmd.Parameters.AddWithValue("@survey_id", surveyID);
                cmd.Parameters.AddWithValue("@order", section.Order);
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
                    CommandText = "spDeleteSection",
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
        public int Update(SectionCreateDTO section)
        {
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spUpdateSection",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };


                cmd.Parameters.AddWithValue("@name", section.Name);
                if (string.IsNullOrEmpty(section.Description))
                    cmd.Parameters.AddWithValue("@description", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@description", section.Description);
                cmd.Parameters.AddWithValue("@update_id", section.UpdatedBY);
                cmd.Parameters.AddWithValue("@id", section.ID);
                cmd.Parameters.AddWithValue("@order", section.Order);

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