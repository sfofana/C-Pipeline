﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Services;
using AwsImgRekCSharp.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AwsImgRekCSharp.Controllers
{
    [Route("api/v1")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly UserService service;
        private readonly FileUtil fileUtil;
        public AuthenticationController(UserService iService, FileUtil iFileUtil)
        {
            service = iService;
            fileUtil = iFileUtil;
        }

        [HttpPost("authenticate")]
        public async Task<User> GetAccess([FromBody] User user)
        {
            return await service.Authenticate(user);
        }
    }
}