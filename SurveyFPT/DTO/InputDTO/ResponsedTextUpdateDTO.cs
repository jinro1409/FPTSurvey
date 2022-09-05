using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class ResponsedTextUpdateDTO : BaseDTO
    {
        public int ResponsedTextID { get; set; }
        public string Response { get; set; }
        public string ResponsedText { get; set; }
    }
}