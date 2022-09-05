using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class SurveyCreateDTO:BaseDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Code { get; set; }
        public string BackgroundColor { get; set; }
        public DateTime OpenTime { get; set; }
        public DateTime CloseTime { get; set; }
        public SurveyCategoryDTO SurveyCategory { get; set; }
        public bool IsRequire { get; set; }
        public bool IsScoreTaken { get; set; }
        public bool IsPublish { get; set; }
        public bool IsAllowChanging { get; set; }
        public string BackgroundImage { get; set; }
        public Dictionary<string,SectionCreateDTO> Sections { get; set; }
    }
}