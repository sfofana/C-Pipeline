using AwsImgRekCSharp.Configurations;
using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Utilities;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Services
{
    public class UserService : IUserService
    {
        private readonly Settings settings;
        private readonly JwtUtil jwtUtil;       
        private readonly HttpClientBuilder client;
        private readonly FileUtil fileUtil;
        public UserService(
            JwtUtil iJwtUtil,
            VaultUtil vaultUtil, 
            HttpClientBuilder iClient, 
            FileUtil iFileUtil
            )
        {
            settings = vaultUtil.decrypt<Settings>();
            jwtUtil = iJwtUtil;     
            client = iClient;
            fileUtil = iFileUtil;
        }
        public async Task<Compare> CompareFacesResults(Compare faces, string token)
        {
            HttpResponseMessage response = await client.http(token)
                .PostAsJsonAsync(settings.compareUrl, faces);
            faces = await response.Content.ReadAsAsync<Compare>();
            return faces;
        }
        public async Task<Upload> ProcessUpload(string fileName, string token)
        {
            MultipartFormDataContent form = fileUtil.getFormData(fileName);

            HttpResponseMessage response = await client.http(token)
                .PostAsync(settings.uploadUrl + fileName, form);
            Upload process = await response.Content.ReadAsAsync<Upload>();
            return process;
        }

        public bool TokenAuthenticated(string token)
        {
            return jwtUtil.validateToken(token);
        }

        public async Task<User> Authenticate(User user)
        {
            HttpResponseMessage response = await client.http(null)
                .PostAsJsonAsync(settings.sessionUrl, user);
            User session = await response.Content.ReadAsAsync<User>();
            session.cToken = jwtUtil.signToken(user);
            return session;
        }

        public async Task<Logging> LogFrontEndToFile(Logging logging)
        {
            HttpResponseMessage response = await client.http(null)
                .PostAsJsonAsync("http://ec2-3-17-26-55.us-east-2.compute.amazonaws.com:9000/api/v1/logging", logging);
            Logging results = await response.Content.ReadAsAsync<Logging>();
            return results;
        }
    }
}
