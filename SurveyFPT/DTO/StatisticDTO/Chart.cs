using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.StatisticDTO
{
    public class Chart
    {
        public string Question { get; set; }
        public int QuestionCategoryId { get; set; }
        public List<string> Labels { get; set; }
        public List<int> Counts { get; set; }
        public List<TextStatisticDTO> Texts { get; set; }

    }
}