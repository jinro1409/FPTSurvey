﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class ResponsedSingleChoiceUpdateDTO : BaseDTO
    {
        public int ChoiceID { get; set; }
        public int OldChoiceID { get; set; }
        public bool IsOtherChoice { get; set; }
        public int? ResponsedIsOtherChoiceID { get; set; }
        public string ResponsedIsOtherChoiceResponse { get; set; }
        public string OldIsOtherChoiceResponse { get; set; }
    }
}