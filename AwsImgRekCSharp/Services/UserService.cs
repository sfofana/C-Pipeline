using AwsImgRekCSharp.Configurations;
using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Utilities;
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
        private string comUrl = "http://ec2-3-17-26-55.us-east-2.compute.amazonaws.com:9000/api/v1/compare";
        private string upUrl = "http://ec2-3-17-26-55.us-east-2.compute.amazonaws.com:9000/api/v1/upload/";
        private readonly HttpClientBuilder client;
        private readonly FileUtil fileUtil;
        public UserService(HttpClientBuilder clientDpnd, FileUtil fileUtilDpnd)
        {
            client = clientDpnd;
            fileUtil = fileUtilDpnd;
        }
        public async Task<Compare> CompareFacesResults(Compare faces)
        {
            HttpResponseMessage response = await client.http().PostAsJsonAsync(comUrl, faces);
            faces = await response.Content.ReadAsAsync<Compare>();
            return faces;
        }
        public async Task<Upload> ProcessUpload(string fileName)
        {
            MultipartFormDataContent form = fileUtil.getFormData(fileName);

            HttpResponseMessage response = await client.http().PostAsync(upUrl + fileName, form);
            Upload process = await response.Content.ReadAsAsync<Upload>();
            return process;
        }
    }
}
