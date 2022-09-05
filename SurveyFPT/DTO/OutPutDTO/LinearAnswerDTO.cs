using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class LinearAnswerDTO:BaseDTO
    {
        public int ScaleNumber { get; set; }
        public string ScaleLabel { get; set; }
    }
}