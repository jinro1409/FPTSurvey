using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SurveyFPT.DTO;
using SurveyFPT.Models;

namespace SurveyFPT.Mapper
{
    public class RoleMapper
    {
        public RoleDTO RoletoRoleDTO(Role r)
        {
            return new RoleDTO
            {
                ID = r.Id,
                Name = r.Name
            };
        }
    }
}