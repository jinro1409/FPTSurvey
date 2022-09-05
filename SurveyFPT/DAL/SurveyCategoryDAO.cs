using SurveyFPT.Data;
using SurveyFPT.Mapper;
using SurveyFPT.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class SurveyCategoryDAO : DbContext
    {
 
        public SurveyCategory Read(int id)
        {
            SurveyCategory survey = null;
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spGetSurveyCategorybyID",
                    //Connection = conn,
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
                    survey = new SurveyCategoryMapper().SQLDataReadertoSurveyCategory(sdr);
                    break;
                }

            }
            catch (Exception ex)
            {


                Console.WriteLine("ReadOnebyCode Procduct fail" + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                    conn.Close();

            }

            return survey;
        }

        public List<SurveyCategory> findAllSurveyCategory()
        {
            List<SurveyCategory> surveys = new List<SurveyCategory>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spFindAllSurveyCategory",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
   
                SqlDataReader sdr = cmd.ExecuteReader();
                SurveyCategory survey;

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        survey = new SurveyCategory();
                        survey = new SurveyCategoryMapper().SQLDataReadertoSurveyCategory(sdr);
                        surveys.Add(survey);
                    }
                }

            }
            catch (Exception ex)
            {


                Console.WriteLine("findAllSurveyCategory Procduct fail" + ex.Message);
                throw;

            }
            finally
            {
                if (conn.State != ConnectionState.Closed) 
                    conn.Close();

            }

            return surveys;
        }

        public Tuple<List<SurveyCategory>,int> findAllSurveyCategorySearch(int page, int pagesize, String search)
        {
            List<SurveyCategory> surveys = new List<SurveyCategory>();
            try
            {
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "spFindAllSurveyCategorySearch",
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
              
                cmd.Parameters.AddWithValue("@total_record", SqlDbType.Int);
                cmd.Parameters["@total_record"].Direction = ParameterDirection.Output;



                cmd.Parameters.Add(param3);
                cmd.Parameters.Add(param4);
                cmd.Parameters.Add(param5);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    SurveyCategory survey = new SurveyCategory();
                    survey = new SurveyCategoryMapper().SQLDataReadertoSurveyCategory(sdr);

                    surveys.Add(survey);


                }
                sdr.Close();

                int totalRecord = Convert.ToInt32(cmd.Parameters["@total_record"].Value);

                return new Tuple<List<SurveyCategory>, int>(surveys, totalRecord);
            }
            catch (Exception ex)
            {
                Console.WriteLine("findAllSurveyCategorySearch Procduct fail" + ex.Message);
                throw;
            }
            finally
            {

                if (conn.State != ConnectionState.Closed)
                    conn.Close();

            }
        }

        public string saveSurveyCategory(SurveyCategory sc, Account admin)
        {
            string ok = "";
            try
            {
                
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = "[spSaveSurveyCategory]",
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@id", sc.ID);
                cmd.Parameters.AddWithValue("@name", sc.Name);
                cmd.Parameters.AddWithValue("@description", sc.Description);
                cmd.Parameters.AddWithValue("@prefix", sc.Prefix.ToUpper().Trim());
                cmd.Parameters.AddWithValue("@status", sc.Status);
                cmd.Parameters.AddWithValue("@created_by", admin.Id);
                cmd.Parameters.AddWithValue("@ok", SqlDbType.NVarChar);
                cmd.Parameters["@ok"].Direction = ParameterDirection.Output;
                cmd.Parameters["@ok"].Size = 255;
                cmd.Parameters["@ok"].Value = " ";

                cmd.ExecuteNonQuery();
                ok = Convert.ToString(cmd.Parameters["@ok"].Value);
                return ok;
            }
            catch (Exception ex)
            {
                Console.WriteLine("saveUserProcedure" + ex.Message);
                throw;
            }
            finally
            {
                if (conn.State != ConnectionState.Closed) 
                    conn.Close();

            }

        }

    }
}