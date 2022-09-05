using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class LinearScaleAnswer:BaseModel
    {
        public int QuestionID { get; set; }
        public int ScaleNumber { get; set; }
        public string ScaleLabel { get; set; }         
    }
}