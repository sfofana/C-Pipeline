using System.IO;
using System.Security.Cryptography;
using System.Text.Json;

namespace AwsImgRekCSharp.Utilities
{
    /// <summary>Vault Utility</summary>
    public class VaultUtil
    {
        private readonly string key = "/home/ec2-user/secret/key";
        private readonly string encryption = "/home/ec2-user/secret/vault";
        /// <summary>Decrypts this instance.</summary>
        /// <typeparam name="T">Any object type typically Settings od Credentials</typeparam>
        /// <returns>Decrypted JSON to string deserialized to poco</returns>
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

        /// <summary>Jsons the string deserializer.</summary>
        /// <typeparam name="T">deserialzes JSON string to type given in parameter</typeparam>
        /// <param name="json">The json.</param>
        /// <returns>Returns fully cooked poco</returns>
        private T jsonStringDeserializer<T>(string json)
        {
            return JsonSerializer.Deserialize<T>(json);
        }
    }
}
