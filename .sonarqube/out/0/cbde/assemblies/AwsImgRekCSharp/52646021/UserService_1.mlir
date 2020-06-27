// Skipping function CompareFacesResults(none, none), it contains poisonous unsupported syntaxes

// Skipping function ProcessUpload(none, none), it contains poisonous unsupported syntaxes

func @_AwsImgRekCSharp.Services.UserService.TokenAuthenticated$string$(none) -> i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :66 :8) {
^entry (%_token : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :66 :39)
cbde.store %_token, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :66 :39)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :68 :19) // Not a variable of known type: jwtUtil
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :68 :41) // Not a variable of known type: token
%3 = cbde.unknown : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :68 :19) // jwtUtil.validateToken(token) (InvocationExpression)
return %3 : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Services\\UserService.cs" :68 :12)

^1: // ExitBlock
cbde.unreachable

}
// Skipping function Authenticate(none), it contains poisonous unsupported syntaxes

// Skipping function LogFrontEndToFile(none), it contains poisonous unsupported syntaxes

