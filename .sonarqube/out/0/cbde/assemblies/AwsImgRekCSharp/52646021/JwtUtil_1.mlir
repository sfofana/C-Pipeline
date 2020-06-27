func @_AwsImgRekCSharp.Utilities.JwtUtil.signToken$AwsImgRekCSharp.Models.User$(none) -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :24 :8) {
^entry (%_user : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :24 :32)
cbde.store %_user, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :24 :32)
br ^0

^0: // JumpBlock
// Entity from another assembly: Encoding
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :26 :25) // Encoding.ASCII (SimpleMemberAccessExpression)
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :26 :49) // Not a variable of known type: settings
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :26 :49) // settings.secretKey (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :26 :25) // Encoding.ASCII.GetBytes(settings.secretKey) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :27 :54) // new SecurityTokenDescriptor              {                  Subject = new ClaimsIdentity(new Claim[]                  {                      new Claim(ClaimTypes.Name, user.role)                  }),                  Expires = DateTime.UtcNow.AddHours(2),                  SigningCredentials = new SigningCredentials(                      new SymmetricSecurityKey(key),                      SecurityAlgorithms.HmacSha256Signature                      )              } (ObjectCreationExpression)
%7 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :29 :55) //  (OmittedArraySizeExpression)
%8 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :29 :49) // Claim[] (ArrayType)
%9 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :29 :45) // new Claim[]                  {                      new Claim(ClaimTypes.Name, user.role)                  } (ArrayCreationExpression)
// Entity from another assembly: ClaimTypes
%10 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :31 :30) // ClaimTypes.Name (SimpleMemberAccessExpression)
%11 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :31 :47) // Not a variable of known type: user
%12 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :31 :47) // user.role (SimpleMemberAccessExpression)
%13 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :31 :20) // new Claim(ClaimTypes.Name, user.role) (ObjectCreationExpression)
%14 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :29 :26) // new ClaimsIdentity(new Claim[]                  {                      new Claim(ClaimTypes.Name, user.role)                  }) (ObjectCreationExpression)
// Entity from another assembly: DateTime
%15 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :33 :26) // DateTime.UtcNow (SimpleMemberAccessExpression)
%16 = constant 2 : i32 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :33 :51)
%17 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :33 :26) // DateTime.UtcNow.AddHours(2) (InvocationExpression)
%18 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :35 :45) // Not a variable of known type: key
%19 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :35 :20) // new SymmetricSecurityKey(key) (ObjectCreationExpression)
// Entity from another assembly: SecurityAlgorithms
%20 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :36 :20) // SecurityAlgorithms.HmacSha256Signature (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :34 :37) // new SigningCredentials(                      new SymmetricSecurityKey(key),                      SecurityAlgorithms.HmacSha256Signature                      ) (ObjectCreationExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: getTokenHandler
%23 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :39 :24) // getTokenHandler() (InvocationExpression)
%24 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :39 :54) // Not a variable of known type: tokenDescriptor
%25 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :39 :24) // getTokenHandler().CreateToken(tokenDescriptor) (InvocationExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: getTokenHandler
%27 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :40 :19) // getTokenHandler() (InvocationExpression)
%28 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :40 :48) // Not a variable of known type: token
%29 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :40 :19) // getTokenHandler().WriteToken(token) (InvocationExpression)
return %29 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :40 :12)

^1: // ExitBlock
cbde.unreachable

}
func @_AwsImgRekCSharp.Utilities.JwtUtil.validateToken$string$(none) -> i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :46 :8) {
^entry (%_token : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :46 :37)
cbde.store %_token, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :46 :37)
br ^0

^0: // JumpBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: getTokenHandler
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :49 :12) // getTokenHandler() (InvocationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :50 :31) // Not a variable of known type: token
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: getParameters
%4 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :50 :38) // getParameters() (InvocationExpression)
%5 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :50 :59) // Not a variable of known type: validToken
%6 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :49 :12) // getTokenHandler()                  .ValidateToken(token, getParameters(), out validToken) (InvocationExpression)
%7 = constant 1 : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :51 :19) // true
return %7 : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :51 :12)

^1: // ExitBlock
cbde.unreachable

}
func @_AwsImgRekCSharp.Utilities.JwtUtil.getTokenHandler$$() -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :54 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :56 :19) // new JwtSecurityTokenHandler() (ObjectCreationExpression)
return %0 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :56 :12)

^1: // ExitBlock
cbde.unreachable

}
func @_AwsImgRekCSharp.Utilities.JwtUtil.getParameters$$() -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :58 :8) {
^entry :
br ^0

^0: // JumpBlock
// Entity from another assembly: Encoding
%0 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :60 :25) // Encoding.ASCII (SimpleMemberAccessExpression)
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :60 :49) // Not a variable of known type: settings
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :60 :49) // settings.secretKey (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :60 :25) // Encoding.ASCII.GetBytes(settings.secretKey) (InvocationExpression)
%5 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :61 :19) // new TokenValidationParameters              {                  ValidateLifetime = false,                   ValidateAudience = false,                   ValidateIssuer = false,                  IssuerSigningKey = new SymmetricSecurityKey(key)               } (ObjectCreationExpression)
%6 = constant 0 : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :63 :35) // false
%7 = constant 0 : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :64 :35) // false
%8 = constant 0 : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :65 :33) // false
%9 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :66 :60) // Not a variable of known type: key
%10 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :66 :35) // new SymmetricSecurityKey(key) (ObjectCreationExpression)
return %5 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\JwtUtil.cs" :61 :12)

^1: // ExitBlock
cbde.unreachable

}
