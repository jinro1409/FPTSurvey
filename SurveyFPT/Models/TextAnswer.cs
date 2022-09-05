using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class TextAnswer:BaseModel
    {
        public int QuestionID { get; set; }
        public string Label { get; set; }
        public int MyProperty { get; set; }
    }
}