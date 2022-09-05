using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class LinearScaleCreateDTO:BaseDTO
    {
        public int ScaleNumber { get; set; }
        public string ScaleLabel { get; set; }
        public int? CreateBY { get; set; }
        public int? UpdateBY { get; set; }

    }
}