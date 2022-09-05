using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SurveyFPT.DTO.Responsed
{
    public class ResponsedAnswerDTO
    {
        public int Id { get; set; }
        public int QuestionID { get; set; }
        public bool IsOtherChoice { get; set; }
        public string ChoiceLabel { get; set; }
        public string OtherText { get; set; }
        public string Text { get; set; }
        public int? LinearID { get; set; }

    }
}
