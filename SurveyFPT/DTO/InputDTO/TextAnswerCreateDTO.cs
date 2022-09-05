using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class TextAnswerCreateDTO : BaseDTO
    {
        public string Label { get; set; }
        public bool CheckTextChoice { get; set; }
        public int OldIdText { get; set; }
    }
}