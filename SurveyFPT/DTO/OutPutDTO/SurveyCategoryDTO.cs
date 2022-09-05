using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class SurveyCategoryDTO 
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Prefix { get; set; }
        public int ID { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int? CreatedBy { get; set; }
        public bool Status { get; set; }
        public int? UpdatedBY { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}