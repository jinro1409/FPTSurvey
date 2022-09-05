using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class QuestionCreateDTO:BaseDTO
    {
        public string QuestionLabel { get; set; }
        public string Description { get; set; }
        public bool IsRequire { get; set; }
        public float PointScale { get; set; }
        public QuestionCategoryDTO QuestionCategory { get; set; }
        public Dictionary<string,ChoiceCreateDTO> ChoiceAnswers { get; set; }
        public List<LinearScaleCreateDTO> LinearAnswers { get; set; }

        public List<LinearScaleCreateDTO> OldLinearAnswers { get; set; }
        public TextAnswerCreateDTO TextAnswer { get; set; }
        public Dictionary<string, TextAnswerCreateDTO> NewTextAnswer { get; set; }

        public int Order { get; set; }
    }
}