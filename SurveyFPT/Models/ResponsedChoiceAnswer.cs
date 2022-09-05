using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class ResponsedChoiceAnswer:BaseModel
    {
        public int ResponseSurveyID { get; set; }
        public int ChoiceID { get; set; }

    }
}