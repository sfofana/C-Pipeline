using AwsImgRekCSharp.Configurations;
using AwsImgRekCSharp.Models;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace AwsImgRekCSharp.Utilities
{
    /// <summary>JWT Utility</summary>
    public class JwtUtil
    {
        private readonly Settings settings;
        /// <summary>Initializes a new instance of the <see cref="JwtUtil" /> class.</summary>
        /// <param name="vaultUtil">The vault utility.</param>
        public JwtUtil(VaultUtil vaultUtil)
        {
            settings = vaultUtil.decrypt<Settings>();
        }

        /// <summary>  Generates a JWT token</summary>
        /// <param name="user">The user.</param>
        /// <returns>the JWT as a string</returns>
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

        /// <summary>Validates the token.</summary>
        /// <param name="token">The token.</param>
        /// <returns>Flag</returns>
        public Boolean validateToken(string token)
        {
            SecurityToken validToken;
            getTokenHandler()
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
