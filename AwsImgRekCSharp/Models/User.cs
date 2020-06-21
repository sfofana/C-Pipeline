using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Models
{
    /// <summary>User poco holding elements which allows user to use application</summary>
    public class User
    {
        public string cToken { get; set; }
        public string jToken { get; set; }
        public string role { get; set; }
    }
}
