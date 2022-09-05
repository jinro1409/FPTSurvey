using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class SurveyResponse:BaseModel
    {
        public int Survey_ID { get; set; }
        public string Email { get; set; }

    }
}