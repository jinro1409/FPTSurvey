using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO.InputDTO
{
    public class ResponsedSurveyUpdateDTO : BaseDTO
    {
        public List<ResponsedLinearScaleUpdateDTO> LinearScaleDTOs { get; set; }
        public List<ResponsedSingleChoiceUpdateDTO> SingleChoiceDTOs { get; set; }
        public List<ResponsedMultipleChoiceUpdateDTO> MultipleChoiceDTOs { get; set; }
        public List<ResponsedTextUpdateDTO> TextDTOs { get; set; }
    }
}
