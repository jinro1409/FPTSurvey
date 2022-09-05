using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class QuestionCategoryDTO:BaseDTO
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public int OldId { get; set; }
    }
}