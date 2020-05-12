using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Configurations
{
    public class Settings
    {
        public string username { get; set; }
        public string password { get; set; }
        public string compareUrl { get; set; }
        public string uploadUrl { get; set; }
        public string directory { get; set; }
        public string folder { get; set; }
        public string extention { get; set; }
        public string formvalue { get; set; }
        public string formtype { get; set; }
        public string getPath()
        {
            return Path.Combine(directory, folder);
        }
    }
}
