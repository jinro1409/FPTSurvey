using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class Question:BaseModel
    {
        public string QuestionLabel { get; set; }
        public string Description { get; set; }
        public bool IsRequire { get; set; }
        public float PointScale { get; set; }
        public int QuestionCategoryID { get; set; }
        public int SectionID { get; set; }
        public int Order { get; set; }
    }
}