using AwsImgRekCSharp.Configurations;
using AwsImgRekCSharp.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace AwsImgRekCSharp.Tests.Controllers
{
    public class UserControllerTest
    {
        private readonly TestServer server;
        private readonly HttpClient client;
        private readonly Credentials credentials;
        private readonly Settings settings;
        public UserControllerTest()
        {
            server = new TestServer(new WebHostBuilder()
                .UseStartup<Startup>());
            client = server.CreateClient();
            credentials = new Credentials
            {
                username = "sfofana",
                password = "UofH2011",
                secretKey = ""
            };
            settings = new Settings
            {
                secretKey = "",
                username = "",
                password = "",
                sessionUrl = "",
                compareUrl = "",
                logUrl = "",
                directory = "C:/Users/sufya/Documents/Repository/PipeLineC#/C-Pipeline",
                folder = "temp",
                extention = ".jpg",
                formvalue = "form-data",
                formtype = "file"
            };
        }

        [Fact]
        public async Task CompareFacesTest()
        {
            User session = await TokenAsync();
            List<string> names = new List<string>();
            names.Add("joe1");
            names.Add("joe2");

            Compare faces = new Compare
            {
                names = names,
                results = 0,
                images = null,
                details = null,

            };
            HttpResponseMessage response = await http(session.cToken, session.jToken)
                .PostAsJsonAsync("/api/v1/compare", faces);
            Compare test = await response.Content.ReadAsAsync<Compare>();

            //HttpResponseMessage response404 = await httpErrorToken(session.cToken, session.jToken)
            //   .PostAsJsonAsync("/api/v1/compare", faces);
            //Compare error = await response404.Content.ReadAsAsync<Compare>();

           // await Assert.ThrowsAsync<FormatException>(async () =>
            //{
            //    HttpResponseMessage response401 = await httpError(session.cToken, session.jToken)
            //        .PostAsJsonAsync("/api/v1/compare", faces);
            //});
            
            //Compare denied = await response401.Content.ReadAsAsync<Compare>();

            Assert.True(test.results > 0);
            Assert.NotNull(test.images);
            Assert.NotNull(test.details);
            //Assert.Null(error);
            //Assert.Null(denied);

        }

        [Fact]
        public async Task ProcessUploadTest()
        {
            User session = await TokenAsync();

            MultipartFormDataContent form = formData();

            HttpResponseMessage response = await http(session.cToken, session.jToken)
                .PostAsync("/api/v1/upload/" + "test", form);
            Upload test = await response.Content.ReadAsAsync<Upload>();
            Assert.NotNull(test.image);
            Assert.NotNull(test.name);
            Assert.NotNull(test.process);
        }
        public HttpClient http(string cToken, string jToken)
        {
            AuthenticationHeaderValue authValue =
                new AuthenticationHeaderValue("Basic", Convert.ToBase64String(
                    Encoding.UTF8.GetBytes($"{credentials.username}:{credentials.password}")
                    ));
            client.DefaultRequestHeaders.Authorization = authValue;
            client.DefaultRequestHeaders.Add("cToken", "Bearer " + cToken);
            client.DefaultRequestHeaders.Add("jToken", "Bearer " + jToken);
            return client;
        }

        public HttpClient httpError(string cToken, string jToken)
        {
            AuthenticationHeaderValue authValue =
                new AuthenticationHeaderValue("Basic", Convert.ToBase64String(
                    Encoding.UTF8.GetBytes($"{credentials.username}typo:{credentials.password}")
                    ));
            client.DefaultRequestHeaders.Authorization = authValue;
            client.DefaultRequestHeaders.Add("cToken", "Bearer " + cToken);
            client.DefaultRequestHeaders.Add("jToken", "Bearer " + jToken);
            return client;
        }

        public HttpClient httpErrorToken(string cToken, string jToken)
        {
            AuthenticationHeaderValue authValue =
                new AuthenticationHeaderValue("Basic", Convert.ToBase64String(
                    Encoding.UTF8.GetBytes($"{credentials.username}:{credentials.password}")
                    ));
            client.DefaultRequestHeaders.Authorization = authValue;
            client.DefaultRequestHeaders.Add("cJwt", "Bearer " + cToken);
            client.DefaultRequestHeaders.Add("jToken", "Bearer " + jToken);
            return client;
        }

        public async Task<User> TokenAsync()
        {
            List<string> tokens = new List<string>();
            User user = new User
            {
                role = "user",
                cToken = "",
                jToken = ""
            };
            HttpResponseMessage response = await client
                .PostAsJsonAsync("/api/v1/authenticate", user);
            User session = await response.Content.ReadAsAsync<User>();
            tokens.Add(session.cToken);
            tokens.Add(session.jToken);
            return session;
        }

        public MultipartFormDataContent formData()
        {
            string fileName = "test";
            string file = Path.Combine(settings.getPath(), "xunit" + settings.extention);
            byte[] data = File.ReadAllBytes(file);

            MultipartFormDataContent form = new MultipartFormDataContent();
            HttpContent content = new ByteArrayContent(data);
            content.Headers.ContentDisposition = new ContentDispositionHeaderValue(settings.formvalue)
            {
                Name = settings.formtype,
                FileName = fileName + settings.extention
            };
            form.Add(content);
            return form;
        }
    }
}
