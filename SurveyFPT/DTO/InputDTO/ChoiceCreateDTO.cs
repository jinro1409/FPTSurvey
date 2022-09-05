using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class ChoiceCreateDTO:BaseDTO
    {
        public string Label { get; set; }
        public bool IsOtherChoice { get; set; }
        public int Order { get; set; }

    }
}