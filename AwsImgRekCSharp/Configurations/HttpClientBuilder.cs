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
        private string username = "sfofana";
        private string password = "UofH2011";
        public HttpClient http()
        {
            HttpClient client = new HttpClient();
            AuthenticationHeaderValue authValue = 
                new AuthenticationHeaderValue("Basic", Convert.ToBase64String(
                    Encoding.UTF8.GetBytes($"{username}:{password}")
                    ));
            client.DefaultRequestHeaders.Authorization = authValue;
            return client;
        }
    }
}
