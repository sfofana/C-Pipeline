using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Models
{
    /// <summary>Upload poco holding upload file details</summary>
    public class Upload
    {
        public string name { get; set; }
        public string process { get; set; }
        public string image { get; set; }
    }
}
