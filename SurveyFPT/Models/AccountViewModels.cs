using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SurveyFPT.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

}
