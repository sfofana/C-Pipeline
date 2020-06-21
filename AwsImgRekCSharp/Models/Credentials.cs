using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Models
{
    /// <summary>Credentials poco holding all necessary configuration secrets</summary>
    public class Credentials
    {
        public string secretKey { get; set; }
        public string username { get; set; }
        public string password { get; set; }
    }
}
