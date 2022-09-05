using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class ResponsedIsOtherChoiceAnswer:BaseModel
    {
        public int ResponseChoiceAnswerID { get; set; }
        public string Text { get; set; }
    }
}