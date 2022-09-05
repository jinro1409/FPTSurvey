using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class ResponseTextAnswerDTO:BaseDTO
    {
        public TextAnswerDTO TextAnswerDTO { get; set; }
        public string Response { get; set; }
    }
}