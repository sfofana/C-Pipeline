using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text.Json;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Utilities
{
    public class VaultUtil
    {
        private string key = "/home/ec2-user/secret/key";
        private string encryption = "/home/ec2-user/secret/vault";
        public T decrypt<T>()
        {
            byte[] iv = new byte[16];
            byte[] buffer = File.ReadAllBytes(encryption);
            string content;

            using (Aes aes = Aes.Create())
            {
                aes.Key = File.ReadAllBytes(key);
                aes.IV = iv;

                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (MemoryStream memory = new MemoryStream(buffer))
                {
                    using (CryptoStream cryptoStream = new CryptoStream(memory, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader streamReader = new StreamReader(cryptoStream))
                        {
                            content = streamReader.ReadToEnd();
                        }
                        return jsonStringDeserializer<T>(content);
                    }
                }
            }
        }

        private T jsonStringDeserializer<T>(string json)
        {
            return JsonSerializer.Deserialize<T>(json);
        }
    }
}
