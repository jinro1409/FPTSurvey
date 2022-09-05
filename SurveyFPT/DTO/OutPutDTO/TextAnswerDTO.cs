using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class TextAnswerDTO:BaseDTO
    {
        public string Label { get; set; }
        public bool CheckTextChoice { get; set; }

    }
}