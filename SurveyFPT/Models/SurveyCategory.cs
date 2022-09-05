using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class SurveyCategory:BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Prefix { get; set; }

    }
}