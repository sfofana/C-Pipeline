using System.IO;

namespace AwsImgRekCSharp.Configurations
{
    /// <summary>Settings poco holding all necessary configuration settings</summary>
    public class Settings
    {
        /// <summary>Gets or sets the secret key.</summary>
        /// <value>The secret key.</value>
        public string secretKey { get; set; }
        /// <summary>Gets or sets the username.</summary>
        /// <value>The username.</value>
        public string username { get; set; }
        /// <summary>Gets or sets the password.</summary>
        /// <value>The password.</value>
        public string password { get; set; }
        /// <summary>Gets or sets the session URL.</summary>
        /// <value>The session URL.</value>
        public string sessionUrl { get; set; }
        /// <summary>
        ///  Gets or sets the compare URL.
        /// </summary>
        /// <value>The compare URL.</value>
        public string compareUrl { get; set; }
        /// <summary>Gets or sets the upload URL.</summary>
        /// <value>The upload URL.</value>
        public string uploadUrl { get; set; }
        /// <summary>Gets or sets the log URL.</summary>
        /// <value>The log URL.</value>
        public string logUrl { get; set; }
        /// <summary>Gets or sets the directory.</summary>
        /// <value>The directory.</value>
        public string directory { get; set; }
        /// <summary>Gets or sets the folder.</summary>
        /// <value>The folder.</value>
        public string folder { get; set; }
        /// <summary>Gets or sets the extention.</summary>
        /// <value>The extention.</value>
        public string extention { get; set; }
        /// <summary>Gets or sets the formvalue.</summary>
        /// <value>The formvalue.</value>
        public string formvalue { get; set; }
        /// <summary>Gets or sets the formtype.</summary>
        /// <value>The formtype.</value>
        public string formtype { get; set; }
        /// <summary>Gets the path.</summary>
        /// <returns></returns>
        public string getPath()
        {
            return Path.Combine(directory, folder);
        }
    }
}
