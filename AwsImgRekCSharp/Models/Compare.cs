using System.Collections.Generic;

namespace AwsImgRekCSharp.Models
{
    /// <summary>Compare poco holding names and faces to compare</summary>
    public class Compare
    {
        /// <summary>Gets or sets the names.</summary>
        /// <value>The names.</value>
        public List<string> names { get; set; }
        /// <summary>Gets or sets the images.</summary>
        /// <value>The images.</value>
        public List<string> images { get; set; }
        /// <summary>Gets or sets the details.</summary>
        /// <value>The details.</value>
        public List<string> details { get; set; }
        /// <summary>Gets or sets the results.</summary>
        /// <value>The results.</value>
        public double results { get; set; }
    }
}
