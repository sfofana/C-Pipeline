using AwsImgRekCSharp.Configurations;
using Microsoft.Extensions.Options;
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
        private readonly IOptions<Settings> settings;
        public FileUtil(IOptions<Settings> iSettings)
        {
            settings = iSettings;
        }
        public string setFile(string fileName)
        {
            string path = Path.Combine(settings.Value.directory, settings.Value.folder);
            Console.WriteLine(path);
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            string SaveAs = Path.Combine(path, fileName + settings.Value.extention);
            return SaveAs;
        }
        public MultipartFormDataContent getFormData(string fileName)
        {
            string path = Path.Combine(settings.Value.directory, settings.Value.folder);
            string file = Path.Combine(path, fileName + settings.Value.extention);
            byte[] data = File.ReadAllBytes(file);

            MultipartFormDataContent form = new MultipartFormDataContent();
            HttpContent content = new ByteArrayContent(data);
            content.Headers.ContentDisposition = new ContentDispositionHeaderValue(settings.Value.formvalue)
            {
                Name = settings.Value.formtype,
                FileName = fileName + settings.Value.extention
            };
            form.Add(content);
            return form;
        }
    }
}
