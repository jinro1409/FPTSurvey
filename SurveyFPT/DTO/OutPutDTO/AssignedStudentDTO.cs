using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class AssignedStudentDTO:BaseDTO
    {
        public int SurveyID { get; set; }
        public string Email { get; set; }
    }
}