namespace AwsImgRekCSharp.Models
{
    /// <summary>Credentials poco holding all necessary configuration secrets</summary>
    public class Credentials
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
    }
}
