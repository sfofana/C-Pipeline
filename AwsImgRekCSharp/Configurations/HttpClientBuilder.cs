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
        private readonly IOptions<Settings> settings;
        public HttpClientBuilder(IOptions<Settings> iSettings)
        {
            settings = iSettings;
        }
        public HttpClient http(string token)
        {
            HttpClient client = new HttpClient();
            AuthenticationHeaderValue authValue = 
                new AuthenticationHeaderValue("Basic", Convert.ToBase64String(
                    Encoding.UTF8.GetBytes($"{settings.Value.username}:{settings.Value.password}")
                    ));
            client.DefaultRequestHeaders.Authorization = authValue;
            client.DefaultRequestHeaders.Add("jToken", "Bearer " + token);
            return client;
        }
    }
}
