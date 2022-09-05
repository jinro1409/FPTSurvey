using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class BaseModel
    {
        public int ID { get; set; }
        public DateTime CreatedAt { get; set; }
        public int CreatedBy { get; set; }
        public bool Status { get; set; }
        public int? UpdatedBY { get; set; }
        public DateTime? UpdatedAt { get; set; }

    }
}