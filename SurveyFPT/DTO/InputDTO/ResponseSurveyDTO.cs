using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class ResponseSurveyDTO:BaseDTO
    {
        public SurveyDTO Survey { get; set; }
        public string Email { get; set; }
        public List<ResponseChoiceAnswerDTO> ResponsedChoiceAnswerDTOs { get; set; }
        public List<ResponseTextAnswerDTO> TextAnswerDTOs { get; set; }
        public List<ResponseLinearScaleAnswerDTO> ResponsedLinearScaleAnswers { get; set; }
    }
}