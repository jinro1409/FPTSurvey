using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.Responsed
{
    public class ResponsedLinearScaleAnswerDTO:BaseDTO
    {
        public int ScaleNumber { get; set; }
        public string ScaleLabel { get; set; }
        public bool IsChecked { get; set; }
        public int ResponsedID { get; set; }
        public int OldSacle { get; set; }
    }
}