using AwsImgRekCSharp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace AwsImgRekCSharp.Tests.Models
{
    public class PocoTest
    {
        [Fact]
        public void credentialsTest()
        {
            Credentials credentials = new Credentials
            {
                username = "sfofana",
                password = "UofH2011",
                secretKey = "yoursecret"
            };
            Assert.Equal("yoursecret", credentials.secretKey);
        }
    }
}
