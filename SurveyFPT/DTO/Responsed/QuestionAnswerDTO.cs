using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SurveyFPT.DTO.Responsed
{
    public class QuestionAnswerDTO
    {
        public string Email { get; set; }
        public DateTime CreatedAt { get; set; }
        public List<string> QuestionAswer { get; set; }
    }
}
