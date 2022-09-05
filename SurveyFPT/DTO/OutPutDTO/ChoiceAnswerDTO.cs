using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class ChoiceAnswerDTO:BaseDTO
    {
        public string Label { get; set; }
        public bool IsOtherChoice { get; set; }
    }
}