using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace TutorOfficeApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        [HttpGet("Value")]
        public string Get()
        {
            return "test string";
        }

    }
}
