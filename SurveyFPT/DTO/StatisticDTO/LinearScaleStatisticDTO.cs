using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.StatisticDTO
{
    public class LinearScaleStatisticDTO
    {
        public int Index { get; set; }

        public int ID{ get; set; }
        public int ScaleNumber { get; set; }
        public string ScaleLabel { get; set; }
        public int Count { get; set; }

    }
}