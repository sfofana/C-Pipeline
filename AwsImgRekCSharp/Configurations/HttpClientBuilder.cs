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
