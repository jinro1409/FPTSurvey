using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.Responsed
{
    public class ResponsedTextAnswerDTO:BaseDTO
    {
        public string Label { get; set; }
        public ResponsedTextDTO ResponsedText { get; set; }
        public int ResponsedID { get; set; }
    }
}