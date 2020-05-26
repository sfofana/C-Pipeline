using AwsImgRekCSharp.Configurations;
using AwsImgRekCSharp.Models;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Utilities
{
    public class JwtUtil
    {
        private readonly Settings settings;
        public JwtUtil(VaultUtil vaultUtil)
        {
            settings = vaultUtil.decrypt<Settings>();
        }

        public string signToken(User user)
        {
            byte[] key = Encoding.ASCII.GetBytes(settings.secretKey);
            SecurityTokenDescriptor tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.role)
                }),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(key),
                    SecurityAlgorithms.HmacSha256Signature
                    )
            };
            var token = getTokenHandler().CreateToken(tokenDescriptor);
            return getTokenHandler().WriteToken(token);
        }

        public Boolean validateToken(string token)
        {
            SecurityToken validToken;
            ClaimsPrincipal principal = getTokenHandler()
                .ValidateToken(token, getParameters(), out validToken);
            return true;
        }

        private JwtSecurityTokenHandler getTokenHandler()
        {
            return new JwtSecurityTokenHandler();
        }
        private TokenValidationParameters getParameters()
        {
            byte[] key = Encoding.ASCII.GetBytes(settings.secretKey);
            return new TokenValidationParameters
            {
                ValidateLifetime = false, 
                ValidateAudience = false, 
                ValidateIssuer = false,
                IssuerSigningKey = new SymmetricSecurityKey(key) 
            };
        }
    }
}
