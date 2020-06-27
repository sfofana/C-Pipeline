using System.Threading.Tasks;
using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Services;
using Microsoft.AspNetCore.Mvc;

namespace AwsImgRekCSharp.Controllers
{
    /// <summary>Controller pinged first for getting full access of the application</summary>
    [Route("api/v1")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly UserService service;
        /// <summary>Initializes a new instance of the <see cref="AuthenticationController" /> class.</summary>
        /// <param name="service">The service.</param>
        public AuthenticationController(UserService service)
        {
            this.service = service;
        }

        /// <summary>Gets the access.</summary>
        /// <param name="user"> Parses user from body</param>
        /// <returns>Returns user with tokens</returns>
        [HttpPost("authenticate")]
        public async Task<User> GetAccess([FromBody] User user)
        {
            return await service.Authenticate(user);
        }

        /// <summary>Fronts the end logs.</summary>
        /// <param name="logging">The logs from the frontend</param>
        /// <returns>Logs saved success message</returns>
        [HttpPost("logging")]
        public async Task<Logging> FrontEndLogs([FromBody] Logging logging)
        {
            return await service.LogFrontEndToFile(logging);
        }
    }
}