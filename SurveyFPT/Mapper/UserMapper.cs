using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SurveyFPT.DAL.RoleDAO;
using SurveyFPT.DTO;
using SurveyFPT.Models;

namespace SurveyFPT.Mapper
{
    public class UserMapper
    {
        public User SQLDataReadertoUser(SqlDataReader sdr)
        {
            User us = null;
            try
            {
                us = new User();
                us.ID = Convert.ToInt32(sdr["id"]);
                us.RoleID = Convert.ToInt32(sdr["role_id"]);
                us.Email = Convert.ToString(sdr["email"]);
                us.Name = Convert.ToString(sdr["name"]);
                us.CreatedBy = Convert.ToInt32(sdr["created_by"]);
                us.CreatedAt = Convert.ToDateTime(sdr["created_at"]);
                us.UpdatedAt = sdr["updated_at"] == null ? Convert.ToDateTime(sdr["updated_at"]):  DateTime.Now;
                us.UpdatedBY = sdr["updated_by"] == null ? Convert.ToInt32(sdr["updated_at"]) : 0;
                us.Status =(bool)sdr["status"];
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
            return us;
        }

        public UserDTO UsertoUserDTO(User us)
        {
            UserDTO userDTO = new UserDTO();
            userDTO.ID = us.ID;
            userDTO.Name = us.Name;
            userDTO.Email = us.Email;
            userDTO.Status = us.Status;
            Role r = new Role();
            r = new RoleDAO().FindRoleById(us.RoleID);
            userDTO.Role = new RoleMapper().RoletoRoleDTO(r);
            return userDTO;
        }
    }
}