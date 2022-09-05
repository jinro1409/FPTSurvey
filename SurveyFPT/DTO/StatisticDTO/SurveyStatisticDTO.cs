using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.StatisticDTO
{
    public class SurveyStatisticDTO
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public DateTime OpenTime { get; set; }
        public DateTime CloseTime { get; set; }
        public SurveyCategoryDTO SurveyCategory { get; set; }
        public List<SectionStatisticDTO> Sections { get; set; }
        public List<ResponseSurveyDTO> Response { get; set; }
        public int Count { get; set; }
        public List<Chart> Charts { get; set; }

    }
}