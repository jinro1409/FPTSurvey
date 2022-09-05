using System;
using System.Collections.Generic;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    [Table(Name = "AssignedStudent")]
    public class AssignedStudentBulkModel
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true, DbType = "Int NOT NULL", UpdateCheck = UpdateCheck.Never)]
        public int id { get; set; }
        [Column(Storage = "email", DbType = "VarChar(50)", UpdateCheck = UpdateCheck.Never)]
        public string email  { get; set; }
        [Column(Storage = "survey_id", DbType = "Int", UpdateCheck = UpdateCheck.Never)]
        public int  survey_id { get; set; }
        [Column(Storage = "created_by", DbType = "Int", UpdateCheck = UpdateCheck.Never)]
        public int created_by { get; set; }
        [Column(Storage = "created_at", DbType = "DateTime", UpdateCheck = UpdateCheck.Never)]
        public DateTime created_at { get; set; }
        [Column(Storage = "created_at", DbType = "Bit", UpdateCheck = UpdateCheck.Never)]
        public bool status { get; set; } = true;
    }
}