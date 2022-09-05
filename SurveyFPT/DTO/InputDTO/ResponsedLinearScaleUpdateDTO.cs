using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class ResponsedLinearScaleUpdateDTO:BaseDTO
    {
        public int LinearID { get; set; }
        public int OldLinearID { get; set; }
    }
}