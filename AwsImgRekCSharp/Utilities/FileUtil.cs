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
        private readonly Settings settings;
        public FileUtil(VaultUtil vaultUtil)
        {
            settings = vaultUtil.decrypt<Settings>();
        }
        public string setFile(string fileName)
        {
            Console.WriteLine(settings.getPath());
            if (!Directory.Exists(settings.getPath()))
            {
                Directory.CreateDirectory(settings.getPath());
            }
            string SaveAs = Path.Combine(settings.getPath(), fileName + settings.extention);
            return SaveAs;
        }
        public MultipartFormDataContent getFormData(string fileName)
        {
            string file = Path.Combine(settings.getPath(), fileName + settings.extention);
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
