using AwsImgRekCSharp.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using System.Net.Http;
using System.Threading.Tasks;
using Xunit;

namespace AwsImgRekCSharp.Tests
{
    public class AuthenticationControllerTest
    {
        private readonly TestServer server;
        private readonly HttpClient client;
        public AuthenticationControllerTest()
        {
            server = new TestServer(new WebHostBuilder()
                .UseStartup<Startup>());
            client = server.CreateClient();
        }
        [Fact]
        public async Task GetAccessTest()
        {
            User user = new User
            {
                role = "user",
                cToken = "",
                jToken = ""
            };
            HttpResponseMessage response = await client
                .PostAsJsonAsync("/api/v1/authenticate", user);
            User test = await response.Content.ReadAsAsync<User>();
            Assert.NotNull(test.cToken);
            Assert.NotNull(test.jToken);
        }

        [Fact]
        public async Task FrontEndLogsTest()
        {
            Logging logging = new Logging
            {
                message = "Jun 21, 2020, 10:11:39 PM : [C#Test] === should write to frontend.txt \n"
            };
            HttpResponseMessage response = await client
                .PostAsJsonAsync("/api/v1/logging", logging);
            Logging test = await response.Content.ReadAsAsync<Logging>();
            Assert.NotNull(test.message);
        }
    }
}
