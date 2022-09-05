using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SurveyFPT.DTO.Responsed
{
    public class SurveyResultSumaryDTO
    {
        public int Id { get; set; }
        public DateTime ResponseTime { get; set; }
        public string Email { get; set; }
        public List<string> Answer { get; set; }
    }
}
