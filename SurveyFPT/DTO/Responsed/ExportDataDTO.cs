
using System.Collections.Generic;
using System;

namespace SurveyFPT.DTO.Responsed
{
    public class ExportDataDTO
    {
        public List<string> Question { get; set; }
        public List<SurveyResultSumaryDTO> Answers { get; set; }
    }
}
