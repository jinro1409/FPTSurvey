using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class QuestionDTO:BaseDTO
    {
        public string QuestionLabel { get; set; }
        public string Description { get; set; }
        public bool IsRequire { get; set; }
        public float PointScale { get; set; }
        public QuestionCategoryDTO QuestionCategory { get; set; }
        public List<ChoiceAnswerDTO> ChoiceAnswers { get; set; }
        public List<LinearAnswerDTO> LinearAnswers { get; set; }
        public TextAnswerDTO TextAnswer { get; set; }
    }
}