using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Utilities
{
    public class FileUtil
    {
        private static string dir = "/home/ec2-user";
        private string path = Path.Combine(dir, "temp");
        private string extn = ".jpg";
        public string setFile(string fileName)
        {
            Console.WriteLine(path);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            string SaveAs = Path.Combine(path, fileName + extn);
            return SaveAs;
        }
        public MultipartFormDataContent getFormData(string fileName)
        {
            string file = Path.Combine(path, fileName + extn);
            byte[] data = File.ReadAllBytes(file);

            MultipartFormDataContent form = new MultipartFormDataContent();
            HttpContent content = new ByteArrayContent(data);
            content.Headers.ContentDisposition = new ContentDispositionHeaderValue("form-data")
            {
                Name = "file",
                FileName = fileName + extn
            };
            form.Add(content);
            return form;
        }
    }
}
