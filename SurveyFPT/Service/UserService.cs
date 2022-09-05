using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SurveyFPT.DAL.UserDAO;
using SurveyFPT.DTO;
using SurveyFPT.Mapper;
using SurveyFPT.Models;

namespace SurveyFPT.Service
{
    public class UserService
    {
        UserMapper userMapper = new UserMapper();

        public UserDTO FindUserByID(int id)
        {
            User user = new UserDAO().FindUserByID(id);
            if (user == null) return null;
            UserDTO userDTO = userMapper.UsertoUserDTO(user);
            return userDTO;
        }

        public Tuple<List<Account>,int> FindAllUser(int page, int pagesize, string search)
        { 
            var tuples = new UserDAO().FindAllUserProcedure(page, pagesize, search);
            return tuples;
        }
    }
}