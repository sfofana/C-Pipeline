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
        private readonly IOptions<Settings> settings;
        private readonly HttpClientBuilder client;
        private readonly FileUtil fileUtil;
        public UserService(IOptions<Settings> iSettings, HttpClientBuilder iClient, FileUtil iFileUtil)
        {
            settings = iSettings;
            client = iClient;
            fileUtil = iFileUtil;
        }
        public async Task<Compare> CompareFacesResults(Compare faces)
        {
            HttpResponseMessage response = await client.http().PostAsJsonAsync(settings.Value.compareUrl, faces);
            faces = await response.Content.ReadAsAsync<Compare>();
            return faces;
        }
        public async Task<Upload> ProcessUpload(string fileName)
        {
            MultipartFormDataContent form = fileUtil.getFormData(fileName);

            HttpResponseMessage response = await client.http().PostAsync(settings.Value.uploadUrl + fileName, form);
            Upload process = await response.Content.ReadAsAsync<Upload>();
            return process;
        }
    }
}
