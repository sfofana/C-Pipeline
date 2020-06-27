namespace AwsImgRekCSharp.Models
{
    /// <summary>User poco holding elements which allows user to use application</summary>
    public class User
    {
        /// <summary>Gets or sets the c token.</summary>
        /// <value>The c token.</value>
        public string cToken { get; set; }
        /// <summary>Gets or sets the j token.</summary>
        /// <value>The j token.</value>
        public string jToken { get; set; }
        /// <summary>Gets or sets the role.</summary>
        /// <value>The role.</value>
        public string role { get; set; }
    }
}
