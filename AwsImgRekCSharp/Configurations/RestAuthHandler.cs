using AwsImgRekCSharp.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Configurations
{
    public class RestAuthHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {
        string username;
        string password;
        private readonly IOptions<Settings> settings;
        private readonly UserService service;
        public RestAuthHandler(
            IOptionsMonitor<AuthenticationSchemeOptions> options,
            IOptions<Settings> iSettings,
            ILoggerFactory logger,
            UrlEncoder encoder,
            ISystemClock clock,
            UserService iService
            )
            : base(options, logger, encoder, clock)
        {
            settings = iSettings;
            service = iService;
        }
        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            if (!Request.Headers.ContainsKey("Authorization"))
                return AuthenticateResult.Fail("Access Denied");

            if (!Request.Headers.ContainsKey("Token"))
                return AuthenticateResult.Fail("Access Denied");

            try
            {
                var authHeader = AuthenticationHeaderValue.Parse(Request.Headers["Authorization"]);
                var credentialBytes = Convert.FromBase64String(authHeader.Parameter);
                string[] credentials = Encoding.UTF8.GetString(credentialBytes).Split(":");
                username = credentials[0];
                password = credentials[1];

                var tokenHeader = AuthenticationHeaderValue.Parse(Request.Headers["cToken"]);
                string token = tokenHeader.Parameter;

                if (username != settings.Value.username || 
                    password != settings.Value.password ||
                    !service.tokenAuthenticated(token)
                    )
                   
                    return AuthenticateResult.Fail("Access Denied");
                else
                {
                    var claims = new[] { new Claim(ClaimTypes.Name, username) };
                    var identity = new ClaimsIdentity(claims, Scheme.Name);
                    var principal = new ClaimsPrincipal(identity);
                    var ticket = new AuthenticationTicket(principal, Scheme.Name);
                    return AuthenticateResult.Success(ticket);
                }

            }
            catch
            {
                return AuthenticateResult.Fail("Invalid Authorization Header");
            }

        }
    }
}
