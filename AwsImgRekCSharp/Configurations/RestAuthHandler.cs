﻿using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Services;
using AwsImgRekCSharp.Utilities;
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
        private readonly Credentials credentials;
        private readonly UserService service;
        public RestAuthHandler(
            VaultUtil vaultUtil,
            IOptionsMonitor<AuthenticationSchemeOptions> options,
            ILoggerFactory logger,
            UrlEncoder encoder,
            ISystemClock clock,
            UserService iService
            )
            : base(options, logger, encoder, clock)
        {
            credentials = vaultUtil.decrypt<Credentials>();
            service = iService;
        }
        /// <summary>Handles the authenticate asynchronous.</summary>
        /// <returns>Global REST configuration requires basic authentication with username and password as well as cToken</returns>
        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            string username;
            string password;

            if (!Request.Headers.ContainsKey("Authorization"))
                return AuthenticateResult.Fail("Access Denied");

            if (!Request.Headers.ContainsKey("cToken"))
                return AuthenticateResult.Fail("Access Denied");

            try
            {
                var authHeader = AuthenticationHeaderValue.Parse(Request.Headers["Authorization"]);
                var credentialBytes = Convert.FromBase64String(authHeader.Parameter);
                string[] userCredentials = Encoding.UTF8.GetString(credentialBytes).Split(":");
                username = userCredentials[0];
                password = userCredentials[1];

                var tokenHeader = AuthenticationHeaderValue.Parse(Request.Headers["cToken"]);
                string token = tokenHeader.Parameter;
                
                if (username != credentials.username || 
                    password != credentials.password ||
                    !service.TokenAuthenticated(token)
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
