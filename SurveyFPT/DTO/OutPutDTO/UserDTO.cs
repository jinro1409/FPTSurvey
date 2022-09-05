using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.DTO
{
    public class UserDTO:BaseDTO
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public RoleDTO Role { get; set; }
    }
}