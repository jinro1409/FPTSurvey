using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.StatisticDTO
{
    public class SectionStatisticDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public List<QuestionStatisticDTO> Questions { get; set; }
    }
}