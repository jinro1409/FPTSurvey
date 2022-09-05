using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class SectionCreateDTO:BaseDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int Order { get; set; }
        public Dictionary<string, QuestionCreateDTO> Questions { get; set; }
    }
}