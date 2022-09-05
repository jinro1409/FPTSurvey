using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class ResponseChoiceAnswerDTO:BaseDTO
    {
        public ChoiceAnswerDTO Choice { get; set; }
        public ResponseIsOtherChoiceDTO IsOtherChoiceText { get; set; }
        public bool IsChecked { get; set; }
    }
}