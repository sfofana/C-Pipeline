using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Models
{
    /// <summary>Compare poco holding names and faces to compare</summary>
    public class Compare
    {
        public List<string> names { get; set; }
        public List<string> images { get; set; }
        public List<string> details { get; set; }
        public double results { get; set; }
    }
}
