using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class ChoiceAnswer:BaseModel
    {
        public int QuestionID { get; set; }
        public string Label { get; set; }
        public bool IsOtherChoice { get; set; }
        public int Order { get; set; }  
    }
}