using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.Responsed
{
    public class ResponsedChoiceAnwerDTO:BaseDTO
    {
        public string Label { get; set; }
        public bool IsOtherChoice { get; set; }
        public bool Ischecked { get; set; }
        public int ResponsedID { get; set; }
        public int OldResponsedID { get; set; }
        public ResponsedIsOtherChoiceDTO ResponsedIsOtherChoice { get; set; }
    }
}