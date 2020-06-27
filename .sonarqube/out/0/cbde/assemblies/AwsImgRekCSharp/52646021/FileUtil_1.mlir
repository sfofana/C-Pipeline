func @_AwsImgRekCSharp.Utilities.FileUtil.setFile$string$(none) -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :21 :8) {
^entry (%_fileName : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :21 :30)
cbde.store %_fileName, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :21 :30)
br ^0

^0: // BinaryBranchBlock
// Entity from another assembly: Console
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :23 :30) // Not a variable of known type: settings
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :23 :30) // settings.getPath() (InvocationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :23 :12) // Console.WriteLine(settings.getPath()) (InvocationExpression)
// Entity from another assembly: Directory
%4 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :24 :34) // Not a variable of known type: settings
%5 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :24 :34) // settings.getPath() (InvocationExpression)
%6 = cbde.unknown : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :24 :17) // Directory.Exists(settings.getPath()) (InvocationExpression)
%7 = cbde.unknown : i1 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :24 :16) // !Directory.Exists(settings.getPath()) (LogicalNotExpression)
cond_br %7, ^1, ^2 loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :24 :16)

^1: // SimpleBlock
// Entity from another assembly: Directory
%8 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :26 :42) // Not a variable of known type: settings
%9 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :26 :42) // settings.getPath() (InvocationExpression)
%10 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :26 :16) // Directory.CreateDirectory(settings.getPath()) (InvocationExpression)
br ^2

^2: // JumpBlock
// Entity from another assembly: Path
%11 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :41) // Not a variable of known type: settings
%12 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :41) // settings.getPath() (InvocationExpression)
%13 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :61) // Not a variable of known type: fileName
%14 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :72) // Not a variable of known type: settings
%15 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :72) // settings.extention (SimpleMemberAccessExpression)
%16 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :61) // Binary expression on unsupported types fileName + settings.extention
%17 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :28 :28) // Path.Combine(settings.getPath(), fileName + settings.extention) (InvocationExpression)
%19 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :29 :19) // Not a variable of known type: SaveAs
return %19 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :29 :12)

^3: // ExitBlock
cbde.unreachable

}
func @_AwsImgRekCSharp.Utilities.FileUtil.getFormData$string$(none) -> none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :34 :8) {
^entry (%_fileName : none):
%0 = cbde.alloca none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :34 :52)
cbde.store %_fileName, %0 : memref<none> loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :34 :52)
br ^0

^0: // JumpBlock
// Entity from another assembly: Path
%1 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :39) // Not a variable of known type: settings
%2 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :39) // settings.getPath() (InvocationExpression)
%3 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :59) // Not a variable of known type: fileName
%4 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :70) // Not a variable of known type: settings
%5 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :70) // settings.extention (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :59) // Binary expression on unsupported types fileName + settings.extention
%7 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :36 :26) // Path.Combine(settings.getPath(), fileName + settings.extention) (InvocationExpression)
// Entity from another assembly: File
%9 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :37 :44) // Not a variable of known type: file
%10 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :37 :26) // File.ReadAllBytes(file) (InvocationExpression)
%12 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :39 :44) // new MultipartFormDataContent() (ObjectCreationExpression)
%14 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :40 :55) // Not a variable of known type: data
%15 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :40 :34) // new ByteArrayContent(data) (ObjectCreationExpression)
%17 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :41 :12) // Not a variable of known type: content
%18 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :41 :12) // content.Headers (SimpleMemberAccessExpression)
%19 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :41 :12) // content.Headers.ContentDisposition (SimpleMemberAccessExpression)
%20 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :41 :83) // Not a variable of known type: settings
%21 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :41 :83) // settings.formvalue (SimpleMemberAccessExpression)
%22 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :41 :49) // new ContentDispositionHeaderValue(settings.formvalue)              {                  Name = settings.formtype,                  FileName = fileName + settings.extention              } (ObjectCreationExpression)
%23 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :43 :23) // Not a variable of known type: settings
%24 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :43 :23) // settings.formtype (SimpleMemberAccessExpression)
%25 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :44 :27) // Not a variable of known type: fileName
%26 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :44 :38) // Not a variable of known type: settings
%27 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :44 :38) // settings.extention (SimpleMemberAccessExpression)
%28 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :44 :27) // Binary expression on unsupported types fileName + settings.extention
%29 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :46 :12) // Not a variable of known type: form
%30 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :46 :21) // Not a variable of known type: content
%31 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :46 :12) // form.Add(content) (InvocationExpression)
%32 = cbde.unknown : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :47 :19) // Not a variable of known type: form
return %32 : none loc("C:\\Users\\sufya\\Documents\\Repository\\PipeLineC#\\C-Pipeline\\AwsImgRekCSharp\\Utilities\\FileUtil.cs" :47 :12)

^1: // ExitBlock
cbde.unreachable

}
