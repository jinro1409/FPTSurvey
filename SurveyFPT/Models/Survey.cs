using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class Survey:BaseModel   
    {
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public DateTime OpenTime { get; set; }
        public DateTime CloseTime { get; set; }
        public int SurveyCategoryID { get; set; }
        public bool IsRequire { get; set; }
        public bool IsScoreTaken { get; set; }
        public bool IsAllowChanging { get; set; }
        public bool IsPublic { get; set; }
        public string BackgroundImage { get; set; }
        public string BackgroundColor { get; set; }

    }
}