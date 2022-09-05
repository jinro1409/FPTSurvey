using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.Responsed
{
    public class ResponsedSectionDTO:BaseDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public List<ResponsedQuestionDTO> Questions { get; set; }
    }
}