using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.Responsed
{
    public class ResponsedQuestionDTO:BaseDTO
    {
        public string QuestionLabel { get; set; }
        public string Description { get; set; }
        public bool IsRequire { get; set; }
        public float PointScale { get; set; }
        public QuestionCategoryDTO QuestionCategory { get; set; }
        public List<ResponsedChoiceAnwerDTO> ChoiceAnswers { get; set; }
        public List<ResponsedLinearScaleAnswerDTO> LinearAnswers { get; set; }
        public ResponsedTextAnswerDTO TextAnswer { get; set; }
    }
}