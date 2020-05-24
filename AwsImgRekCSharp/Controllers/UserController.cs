using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Services;
using AwsImgRekCSharp.Utilities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AwsImgRekCSharp.Controllers
{
    [Authorize]
    [Route("api/v1")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly JwtUtil jwtUtil;
        private readonly UserService service;
        private readonly FileUtil fileUtil;
        public UserController(
            JwtUtil iJwtutil,
            UserService iService, 
            FileUtil iFileUtil
            )
        {
            jwtUtil = iJwtutil;
            service = iService;
            fileUtil = iFileUtil;
        }
        [HttpGet("compare")]
        public async Task<Compare> CompareFacesGet([FromBody] Compare faces)
        {
            return await service.CompareFacesResults(faces, getToken());
        }

        [HttpPost("compare")]
        public async Task<Compare> CompareFaces([FromBody] Compare faces)
        {           
            return await service.CompareFacesResults(faces, getToken());
        }

        [HttpPost("upload/{name}")]
        public async Task<Upload> Upload(string name)
        {
            var file = Request.Form.Files[0];          
            if (file.Length > 0)
            {
                string SaveAs = fileUtil.setFile(name);
                using (var stream = new FileStream(SaveAs, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
            }
            return await service.ProcessUpload(name, getToken());
        }

        private string getToken()
        {
            var tokenHeader = AuthenticationHeaderValue.Parse(Request.Headers["jToken"]);
            return tokenHeader.Parameter;
        }

    }
}
