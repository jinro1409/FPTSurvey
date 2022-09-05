using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SurveyFPT.Data
{
    public class DbContext : IDisposable
    {
        public DbContext()
        {

        }

        private SqlConnection _conn;
        public SqlConnection conn { 
            get {
                
                if (_conn == null)
                {
                    string strCnn = ConfigurationManager.ConnectionStrings["FUsurvey"].ConnectionString;
                    _conn = new SqlConnection(strCnn);
                }


                if (_conn.State != System.Data.ConnectionState.Open)
                    _conn.Open();

                return _conn;
            }
        }

        public void Dispose()
        {
            if (conn.State != System.Data.ConnectionState.Closed)
                conn.Close();
        }
    }
}