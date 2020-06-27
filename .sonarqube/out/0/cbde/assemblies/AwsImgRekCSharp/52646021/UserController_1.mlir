// Skipping function CompareFaces(none), it contains poisonous unsupported syntaxes

// Skipping function Upload(none), it contains poisonous unsupported syntaxes

func @_AwsImgRekCSharp.Controllers.UserController.getToken$$() -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :60 :8) {
^entry :
br ^0

^0: // JumpBlock
// Entity from another assembly: AuthenticationHeaderValue
%0 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :62 :62) // Identifier from another assembly: Request
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :62 :62) // Request.Headers (SimpleMemberAccessExpression)
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :62 :78) // "jToken" (StringLiteralExpression)
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :62 :62) // Request.Headers["jToken"] (ElementAccessExpression)
%4 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :62 :30) // AuthenticationHeaderValue.Parse(Request.Headers["jToken"]) (InvocationExpression)
%6 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :63 :19) // Not a variable of known type: tokenHeader
%7 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :63 :19) // tokenHeader.Parameter (SimpleMemberAccessExpression)
return %7 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Controllers\\UserController.cs" :63 :12)

^1: // ExitBlock
cbde.unreachable

}
