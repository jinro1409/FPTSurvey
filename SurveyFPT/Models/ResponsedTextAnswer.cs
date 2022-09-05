using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class ResponsedTextAnswer:BaseModel
    {
        public int ResponseSurveyID { get; set; }
        public int TextAnswerID { get; set; }
        public string Response { get; set; }
    }
}