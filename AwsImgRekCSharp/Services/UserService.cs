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
        private readonly JwtUtil jwtUtil;
        private readonly IOptions<Settings> settings;
        private readonly HttpClientBuilder client;
        private readonly FileUtil fileUtil;
        public UserService(
            JwtUtil iJwtUtil,
            IOptions<Settings> iSettings, 
            HttpClientBuilder iClient, 
            FileUtil iFileUtil
            )
        {
            jwtUtil = iJwtUtil;
            settings = iSettings;
            client = iClient;
            fileUtil = iFileUtil;
        }
        public async Task<Compare> CompareFacesResults(Compare faces, string token)
        {
            setHeader(token);
            HttpResponseMessage response = await client.http()
                .PostAsJsonAsync(settings.Value.compareUrl, faces);
            faces = await response.Content.ReadAsAsync<Compare>();
            return faces;
        }
        public async Task<Upload> ProcessUpload(string fileName, string token)
        {
            setHeader(token);
            MultipartFormDataContent form = fileUtil.getFormData(fileName);

            HttpResponseMessage response = await client.http()
                .PostAsync(settings.Value.uploadUrl + fileName, form);
            Upload process = await response.Content.ReadAsAsync<Upload>();
            return process;
        }

        public Boolean tokenAuthenticated(string token)
        {
            return jwtUtil.validateToken(token);
        }

        public async Task<User> Authenticate(User user)
        {
            HttpResponseMessage response = await client.http()
                .PostAsJsonAsync(settings.Value.sessionUrl, user);
            User session = await response.Content.ReadAsAsync<User>();
            session.cToken = jwtUtil.signToken(user);
            return session;
        }

        private void setHeader(string token)
        {
            client.http().DefaultRequestHeaders.Add("jToken", "Bearer " + token);
        }
    }
}
