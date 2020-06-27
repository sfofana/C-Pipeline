// Skipping function decrypt(), it contains poisonous unsupported syntaxes

func @_AwsImgRekCSharp.Utilities.VaultUtil.jsonStringDeserializer$T$$string$(none) -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\VaultUtil.cs" :45 :8) {
^entry (%_json : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\VaultUtil.cs" :45 :44)
cbde.store %_json, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\VaultUtil.cs" :45 :44)
br ^0

^0: // JumpBlock
// Entity from another assembly: JsonSerializer
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\VaultUtil.cs" :47 :49) // Not a variable of known type: json
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\VaultUtil.cs" :47 :19) // JsonSerializer.Deserialize<T>(json) (InvocationExpression)
return %2 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\VaultUtil.cs" :47 :12)

^1: // ExitBlock
cbde.unreachable

}
