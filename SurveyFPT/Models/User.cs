using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class User:BaseModel

    {
        public string Email { get; set; }
        public string Name { get; set; }
        public int RoleID { get; set; }
    }
}