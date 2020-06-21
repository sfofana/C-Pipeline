using AwsImgRekCSharp.Utilities;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Configurations
{
    public class HttpClientBuilder
    {
        private readonly Settings settings;
        public HttpClientBuilder(VaultUtil vaultUtil)
        {
            settings = vaultUtil.decrypt<Settings>();
        }
        /// <summary>HTTPs the specified token.</summary>
        /// <param name="token">  The required Java JWT token to make a request</param>
        /// <returns>Returns a rest client with built in basic auth and token bearer</returns>
        public HttpClient http(string token)
        {
            HttpClient client = new HttpClient();
            AuthenticationHeaderValue authValue = 
                new AuthenticationHeaderValue("Basic", Convert.ToBase64String(
                    Encoding.UTF8.GetBytes($"{settings.username}:{settings.password}")
                    ));
            client.DefaultRequestHeaders.Authorization = authValue;
            client.DefaultRequestHeaders.Add("jToken", "Bearer " + token);
            return client;
        }
    }
}
