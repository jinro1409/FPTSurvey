using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.StatisticDTO
{
    public class QuestionStatisticDTO
    {
        public int ID { get; set; }
        public string Questions { get; set; }
        public int QuestionCatagory { get; set; }
        public List<ChoiceStatisticDTO> ChoiceStatistics { get; set; }
        public List<LinearScaleStatisticDTO> LinearScaleStatistics { get; set; }
        public Tuple<int, List<TextStatisticDTO>> TextStatistics { get; set; }
        public int Count { get; set; }

    }
}