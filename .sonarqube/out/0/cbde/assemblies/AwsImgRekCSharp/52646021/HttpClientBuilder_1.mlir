func @_AwsImgRekCSharp.Configurations.HttpClientBuilder.http$string$(none) -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :23 :8) {
^entry (%_token : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :23 :31)
cbde.store %_token, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :23 :31)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :25 :32) // new HttpClient() (ObjectCreationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :27 :46) // "Basic" (StringLiteralExpression)
// Entity from another assembly: Convert
// Entity from another assembly: Encoding
%4 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :20) // Encoding.UTF8 (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :46) // Not a variable of known type: settings
%6 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :46) // settings.username (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :66) // Not a variable of known type: settings
%8 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :66) // settings.password (SimpleMemberAccessExpression)
%9 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :43) // $"{settings.username}:{settings.password}" (InterpolatedStringExpression)
%10 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :28 :20) // Encoding.UTF8.GetBytes($"{settings.username}:{settings.password}") (InvocationExpression)
%11 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :27 :55) // Convert.ToBase64String(                      Encoding.UTF8.GetBytes($"{settings.username}:{settings.password}")                      ) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :27 :16) // new AuthenticationHeaderValue("Basic", Convert.ToBase64String(                      Encoding.UTF8.GetBytes($"{settings.username}:{settings.password}")                      )) (ObjectCreationExpression)
%14 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :30 :12) // Not a variable of known type: client
%15 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :30 :12) // client.DefaultRequestHeaders (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :30 :12) // client.DefaultRequestHeaders.Authorization (SimpleMemberAccessExpression)
%17 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :30 :57) // Not a variable of known type: authValue
%18 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :12) // Not a variable of known type: client
%19 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :12) // client.DefaultRequestHeaders (SimpleMemberAccessExpression)
%20 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :45) // "jToken" (StringLiteralExpression)
%21 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :55) // "Bearer " (StringLiteralExpression)
%22 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :67) // Not a variable of known type: token
%23 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :55) // Binary expression on unsupported types "Bearer " + token
%24 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :31 :12) // client.DefaultRequestHeaders.Add("jToken", "Bearer " + token) (InvocationExpression)
%25 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :32 :19) // Not a variable of known type: client
return %25 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Configurations\\HttpClientBuilder.cs" :32 :12)

^1: // ExitBlock
cbde.unreachable

}
