using SurveyFPT.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace SurveyFPT.Controllers.API
{
    [RoutePrefix("api/survey")]
    public class DefaultController : ApiController
    {
        [HttpGet]
        [Route("{username}")]
        public IHttpActionResult Read([FromUri] string username)
        {
            try
            {
                var data = new SurveyService().Read(username);
                return Ok(data);

            }
            catch (Exception)
            {
                return InternalServerError();
            }
        }
    }

  
}
