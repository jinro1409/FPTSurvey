using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class Section:BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int SurveyID { get; set; }
        public int Order { get; set; }

    }
}