using AwsImgRekCSharp.Configurations;
using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;

namespace AwsImgRekCSharp.Utilities
{
    /// <summary>File Utility</summary>
    public class FileUtil
    {
        private readonly Settings settings;
        /// <summary>Initializes a new instance of the <see cref="FileUtil" /> class.</summary>
        /// <param name="vaultUtil">The vault utility.</param>
        public FileUtil(VaultUtil vaultUtil)
        {
            settings = vaultUtil.decrypt<Settings>();
        }
        /// <summary>Sets and saves the file.</summary>
        /// <param name="fileName">Name of the file.</param>
        /// <returns>File path</returns>
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
        /// <summary>  Prepares form data for a file.</summary>
        /// <param name="fileName">Name of the file.</param>
        /// <returns>Form data content for post request</returns>
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
