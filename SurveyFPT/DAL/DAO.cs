using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.DAL
{
    public class DAO
    {
        static public string strConn = ConfigurationManager.ConnectionStrings["FUsurvey"].ConnectionString;

        public SqlConnection cnn; //Ket noi DB
        SqlDataAdapter da; //Xu ly cac cau lenh sql: select
        public DAO()
        {
            connect();
        }

        public void connect()
        {
            try
            {
                cnn = new SqlConnection(strConn);
                if (cnn.State == ConnectionState.Open)
                {
                    cnn.Close();
                }
                cnn.Open();
                Console.WriteLine("Connect success !");
            }
            catch (Exception ex)
            {
                Console.WriteLine("connect" + ex.Message);
            }
        }


        public DataTable excuteQuery(string strSelect)
        {
            DataTable dt = new DataTable();
            try
            {
                da = new SqlDataAdapter(strSelect, cnn);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                Console.WriteLine("loi execute query: " + ex.Message);
            }
            return dt;
        }

        public void ExcuteNonQuery(string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query);
                cmd.Connection = cnn;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi excute non query: " + ex.Message);
            }
        }
    }
}