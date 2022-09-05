using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.StatisticDTO
{
    public class ChoiceStatisticDTO
    {
        public int Index { get; set; }
        public int ID { get; set; }
        public string Label { get; set; }
        public bool IsOtherChoice { get; set; }
        public List<TextStatisticDTO> OtherChoiceStatistics { get; set; }
        public int Count { get; set; }
    }
}