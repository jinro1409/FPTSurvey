using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SurveyFPT.Models
{
    public class Account
    {
        private int id;
        private string name, mail;
        private Role role;
        private Boolean active;

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Mail { get => mail; set => mail = value; }
        public Role Role { get => role; set => role = value; }
        public bool Active { get => active; set => active = value; }
    }
}