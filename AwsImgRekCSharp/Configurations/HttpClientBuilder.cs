using AwsImgRekCSharp.Utilities;
using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;

namespace AwsImgRekCSharp.Configurations
{

    /// <summary>Template for http client.</summary>
    public class HttpClientBuilder
    {
        private readonly Settings settings;

        /// <summary>Initializes a new instance of the <see cref="HttpClientBuilder" /> class.</summary>
        /// <param name="vaultUtil">The vault utility.</param>
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
