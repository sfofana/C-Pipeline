è
mC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Configurations\HttpClientBuilder.cs
	namespace 	
AwsImgRekCSharp
 
. 
Configurations (
{ 
public 

class 
HttpClientBuilder "
{ 
private 
readonly 
Settings !
settings" *
;* +
public 
HttpClientBuilder  
(  !
	VaultUtil! *
	vaultUtil+ 4
)4 5
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
} 	
public 

HttpClient 
http 
( 
string %
token& +
)+ ,
{ 	

HttpClient 
client 
= 
new  #

HttpClient$ .
(. /
)/ 0
;0 1%
AuthenticationHeaderValue %
	authValue& /
=0 1
new %
AuthenticationHeaderValue -
(- .
$str. 5
,5 6
Convert7 >
.> ?
ToBase64String? M
(M N
Encoding 
. 
UTF8 !
.! "
GetBytes" *
(* +
$"+ -
{- .
settings. 6
.6 7
username7 ?
}? @
:@ A
{A B
settingsB J
.J K
passwordK S
}S T
"T U
)U V
) 
) 
; 
client 
. !
DefaultRequestHeaders (
.( )
Authorization) 6
=7 8
	authValue9 B
;B C
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 5
,5 6
$str7 @
+A B
tokenC H
)H I
;I J
return   
client   
;   
}!! 	
}"" 
}## Ø0
kC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Configurations\RestAuthHandler.cs
	namespace 	
AwsImgRekCSharp
 
. 
Configurations (
{ 
public 

class 
RestAuthHandler  
:! "!
AuthenticationHandler# 8
<8 9'
AuthenticationSchemeOptions9 T
>T U
{ 
private 
readonly 
Credentials $
credentials% 0
;0 1
private 
readonly 
UserService $
service% ,
;, -
public 
RestAuthHandler 
( 
	VaultUtil 
	vaultUtil 
,  
IOptionsMonitor 
< '
AuthenticationSchemeOptions 7
>7 8
options9 @
,@ A
ILoggerFactory 
logger !
,! "

UrlEncoder 
encoder 
, 
ISystemClock 
clock 
, 
UserService 
iService  
) 
: 
base 
( 
options 
, 
logger "
," #
encoder$ +
,+ ,
clock- 2
)2 3
{ 	
credentials   
=   
	vaultUtil   #
.  # $
decrypt  $ +
<  + ,
Credentials  , 7
>  7 8
(  8 9
)  9 :
;  : ;
service!! 
=!! 
iService!! 
;!! 
}"" 	
	protected%% 
override%% 
async%%  
Task%%! %
<%%% &
AuthenticateResult%%& 8
>%%8 9#
HandleAuthenticateAsync%%: Q
(%%Q R
)%%R S
{&& 	
string'' 
username'' 
;'' 
string(( 
password(( 
;(( 
if** 
(** 
!** 
Request** 
.** 
Headers**  
.**  !
ContainsKey**! ,
(**, -
$str**- <
)**< =
)**= >
return++ 
AuthenticateResult++ )
.++) *
Fail++* .
(++. /
$str++/ >
)++> ?
;++? @
if-- 
(-- 
!-- 
Request-- 
.-- 
Headers--  
.--  !
ContainsKey--! ,
(--, -
$str--- 5
)--5 6
)--6 7
return.. 
AuthenticateResult.. )
...) *
Fail..* .
(... /
$str../ >
)..> ?
;..? @
try00 
{11 
var22 

authHeader22 
=22  %
AuthenticationHeaderValue22! :
.22: ;
Parse22; @
(22@ A
Request22A H
.22H I
Headers22I P
[22P Q
$str22Q `
]22` a
)22a b
;22b c
var33 
credentialBytes33 #
=33$ %
Convert33& -
.33- .
FromBase64String33. >
(33> ?

authHeader33? I
.33I J
	Parameter33J S
)33S T
;33T U
string44 
[44 
]44 
userCredentials44 (
=44) *
Encoding44+ 3
.443 4
UTF8444 8
.448 9
	GetString449 B
(44B C
credentialBytes44C R
)44R S
.44S T
Split44T Y
(44Y Z
$str44Z ]
)44] ^
;44^ _
username55 
=55 
userCredentials55 *
[55* +
$num55+ ,
]55, -
;55- .
password66 
=66 
userCredentials66 *
[66* +
$num66+ ,
]66, -
;66- .
var88 
tokenHeader88 
=88  !%
AuthenticationHeaderValue88" ;
.88; <
Parse88< A
(88A B
Request88B I
.88I J
Headers88J Q
[88Q R
$str88R Z
]88Z [
)88[ \
;88\ ]
string99 
token99 
=99 
tokenHeader99 *
.99* +
	Parameter99+ 4
;994 5
if;; 
(;; 
username;; 
!=;; 
credentials;;  +
.;;+ ,
username;;, 4
||;;5 7
password<< 
!=<< 
credentials<<  +
.<<+ ,
password<<, 4
||<<5 7
!== 
service== 
.== 
TokenAuthenticated== /
(==/ 0
token==0 5
)==5 6
)>> 
return@@ 
AuthenticateResult@@ -
.@@- .
Fail@@. 2
(@@2 3
$str@@3 B
)@@B C
;@@C D
elseAA 
{BB 
varCC 
claimsCC 
=CC  
newCC! $
[CC$ %
]CC% &
{CC' (
newCC) ,
ClaimCC- 2
(CC2 3

ClaimTypesCC3 =
.CC= >
NameCC> B
,CCB C
usernameCCD L
)CCL M
}CCN O
;CCO P
varDD 
identityDD  
=DD! "
newDD# &
ClaimsIdentityDD' 5
(DD5 6
claimsDD6 <
,DD< =
SchemeDD> D
.DDD E
NameDDE I
)DDI J
;DDJ K
varEE 
	principalEE !
=EE" #
newEE$ '
ClaimsPrincipalEE( 7
(EE7 8
identityEE8 @
)EE@ A
;EEA B
varFF 
ticketFF 
=FF  
newFF! $ 
AuthenticationTicketFF% 9
(FF9 :
	principalFF: C
,FFC D
SchemeFFE K
.FFK L
NameFFL P
)FFP Q
;FFQ R
returnGG 
AuthenticateResultGG -
.GG- .
SuccessGG. 5
(GG5 6
ticketGG6 <
)GG< =
;GG= >
}HH 
}JJ 
catchKK 
{LL 
returnMM 
AuthenticateResultMM )
.MM) *
FailMM* .
(MM. /
$strMM/ M
)MMM N
;MMN O
}NN 
}PP 	
}QQ 
}RR ù
dC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Configurations\Settings.cs
	namespace 	
AwsImgRekCSharp
 
. 
Configurations (
{ 
public

 

class

 
Settings

 
{ 
public 
string 
	secretKey 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

sessionUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 

compareUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
	uploadUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	directory 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
folder 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	extention 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
	formvalue 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
formtype 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
getPath 
( 
) 
{ 	
return 
Path 
. 
Combine 
(  
	directory  )
,) *
folder+ 1
)1 2
;2 3
} 	
} 
} ¶
qC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Controllers\AuthenticationController.cs
	namespace 	
AwsImgRekCSharp
 
. 
Controllers %
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class $
AuthenticationController )
:* +
ControllerBase, :
{ 
private 
readonly 
UserService $
service% ,
;, -
private 
readonly 
FileUtil !
fileUtil" *
;* +
public $
AuthenticationController '
(' (
UserService( 3
iService4 <
,< =
FileUtil> F
	iFileUtilG P
)P Q
{ 	
service 
= 
iService 
; 
fileUtil 
= 
	iFileUtil  
;  !
} 	
[ 	
HttpPost	 
( 
$str  
)  !
]! "
public 
async 
Task 
< 
User 
> 
	GetAccess  )
() *
[* +
FromBody+ 3
]3 4
User5 9
user: >
)> ?
{ 	
return 
await 
service  
.  !
Authenticate! -
(- .
user. 2
)2 3
;3 4
}   	
["" 	
HttpPost""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
Logging## !
>##! "
FrontEndLogs### /
(##/ 0
[##0 1
FromBody##1 9
]##9 :
Logging##; B
logging##C J
)##J K
{$$ 	
return%% 
await%% 
service%%  
.%%  !
LogFrontEndToFile%%! 2
(%%2 3
logging%%3 :
)%%: ;
;%%; <
}&& 	
}'' 
}(( ¢
gC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Controllers\UserController.cs
	namespace 	
AwsImgRekCSharp
 
. 
Controllers %
{ 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
private 
readonly 
JwtUtil  
jwtUtil! (
;( )
private 
readonly 
UserService $
service% ,
;, -
private 
readonly 
FileUtil !
fileUtil" *
;* +
public 
UserController 
( 
JwtUtil 
iJwtutil 
, 
UserService 
iService  
,  !
FileUtil 
	iFileUtil 
) 
{ 	
jwtUtil 
= 
iJwtutil 
; 
service   
=   
iService   
;   
fileUtil!! 
=!! 
	iFileUtil!!  
;!!  !
}"" 	
['' 	
HttpPost''	 
('' 
$str'' 
)'' 
]'' 
public(( 
async(( 
Task(( 
<(( 
Compare(( !
>((! "
CompareFaces((# /
(((/ 0
[((0 1
FromBody((1 9
]((9 :
Compare((; B
faces((C H
)((H I
{)) 	
return** 
await** 
service**  
.**  !
CompareFacesResults**! 4
(**4 5
faces**5 :
,**: ;
getToken**< D
(**D E
)**E F
)**F G
;**G H
}++ 	
[00 	
HttpPost00	 
(00 
$str00 !
)00! "
]00" #
public11 
async11 
Task11 
<11 
Upload11  
>11  !
Upload11" (
(11( )
string11) /
name110 4
)114 5
{22 	
var33 
file33 
=33 
Request33 
.33 
Form33 #
.33# $
Files33$ )
[33) *
$num33* +
]33+ ,
;33, -
if44 
(44 
file44 
.44 
Length44 
>44 
$num44 
)44  
{55 
string66 
SaveAs66 
=66 
fileUtil66  (
.66( )
setFile66) 0
(660 1
name661 5
)665 6
;666 7
using77 
(77 
var77 
stream77 !
=77" #
new77$ '

FileStream77( 2
(772 3
SaveAs773 9
,779 :
FileMode77; C
.77C D
Create77D J
)77J K
)77K L
{88 
file99 
.99 
CopyTo99 
(99  
stream99  &
)99& '
;99' (
}:: 
};; 
return<< 
await<< 
service<<  
.<<  !
ProcessUpload<<! .
(<<. /
name<</ 3
,<<3 4
getToken<<5 =
(<<= >
)<<> ?
)<<? @
;<<@ A
}== 	
privateAA 
stringAA 
getTokenAA 
(AA  
)AA  !
{BB 	
varCC 
tokenHeaderCC 
=CC %
AuthenticationHeaderValueCC 7
.CC7 8
ParseCC8 =
(CC= >
RequestCC> E
.CCE F
HeadersCCF M
[CCM N
$strCCN V
]CCV W
)CCW X
;CCX Y
returnDD 
tokenHeaderDD 
.DD 
	ParameterDD (
;DD( )
}EE 	
}GG 
}HH ü
[C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Compare.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public		 

class		 
Compare		 
{

 
public 
List 
< 
string 
> 
names !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
List 
< 
string 
> 
images "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
List 
< 
string 
> 
details #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
double 
results 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} É
_C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Credentials.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public		 

class		 
Credentials		 
{

 
public 
string 
	secretKey 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¡
[C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Logging.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public 

class 
Logging 
{		 
public

 
string

 
message

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
} 
} 
ZC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Upload.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public		 

class		 
Upload		 
{

 
public 
string 
name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
process 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
image 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ï
XC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\User.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public		 

class		 
User		 
{

 
public 
string 
cToken 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
jToken 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ù

TC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Program.cs
	namespace 	
AwsImgRekCSharp
 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ∏
bC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Services\IUserService.cs
	namespace 	
AwsImgRekCSharp
 
. 
Services "
{ 
public		 

	interface		 
IUserService		 !
{

 
} 
} ä/
aC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Services\UserService.cs
	namespace 	
AwsImgRekCSharp
 
. 
Services "
{ 
public 

class 
UserService 
: 
IUserService +
{ 
private 
readonly 
Settings !
settings" *
;* +
private 
readonly 
JwtUtil  
jwtUtil! (
;( )
private 
readonly 
HttpClientBuilder *
client+ 1
;1 2
private 
readonly 
FileUtil !
fileUtil" *
;* +
public 
UserService 
( 
JwtUtil 
iJwtUtil 
, 
	VaultUtil 
	vaultUtil 
,  
HttpClientBuilder 
iClient %
,% &
FileUtil 
	iFileUtil 
) 
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
jwtUtil 
= 
iJwtUtil 
; 
client 
= 
iClient 
; 
fileUtil   
=   
	iFileUtil    
;    !
}!! 	
public"" 
async"" 
Task"" 
<"" 
Compare"" !
>""! "
CompareFacesResults""# 6
(""6 7
Compare""7 >
faces""? D
,""D E
string""F L
token""M R
)""R S
{## 	
HttpResponseMessage$$ 
response$$  (
=$$) *
await$$+ 0
client$$1 7
.$$7 8
http$$8 <
($$< =
token$$= B
)$$B C
.%% 
PostAsJsonAsync%%  
(%%  !
settings%%! )
.%%) *

compareUrl%%* 4
,%%4 5
faces%%6 ;
)%%; <
;%%< =
faces&& 
=&& 
await&& 
response&& "
.&&" #
Content&&# *
.&&* +
ReadAsAsync&&+ 6
<&&6 7
Compare&&7 >
>&&> ?
(&&? @
)&&@ A
;&&A B
return'' 
faces'' 
;'' 
}(( 	
public)) 
async)) 
Task)) 
<)) 
Upload))  
>))  !
ProcessUpload))" /
())/ 0
string))0 6
fileName))7 ?
,))? @
string))A G
token))H M
)))M N
{** 	$
MultipartFormDataContent++ $
form++% )
=++* +
fileUtil++, 4
.++4 5
getFormData++5 @
(++@ A
fileName++A I
)++I J
;++J K
HttpResponseMessage-- 
response--  (
=--) *
await--+ 0
client--1 7
.--7 8
http--8 <
(--< =
token--= B
)--B C
... 
	PostAsync.. 
(.. 
settings.. #
...# $
	uploadUrl..$ -
+... /
fileName..0 8
,..8 9
form..: >
)..> ?
;..? @
Upload// 
process// 
=// 
await// "
response//# +
.//+ ,
Content//, 3
.//3 4
ReadAsAsync//4 ?
<//? @
Upload//@ F
>//F G
(//G H
)//H I
;//I J
return00 
process00 
;00 
}11 	
public33 
bool33 
TokenAuthenticated33 &
(33& '
string33' -
token33. 3
)333 4
{44 	
return55 
jwtUtil55 
.55 
validateToken55 (
(55( )
token55) .
)55. /
;55/ 0
}66 	
public88 
async88 
Task88 
<88 
User88 
>88 
Authenticate88  ,
(88, -
User88- 1
user882 6
)886 7
{99 	
HttpResponseMessage:: 
response::  (
=::) *
await::+ 0
client::1 7
.::7 8
http::8 <
(::< =
null::= A
)::A B
.;; 
PostAsJsonAsync;;  
(;;  !
settings;;! )
.;;) *

sessionUrl;;* 4
,;;4 5
user;;6 :
);;: ;
;;;; <
User<< 
session<< 
=<< 
await<<  
response<<! )
.<<) *
Content<<* 1
.<<1 2
ReadAsAsync<<2 =
<<<= >
User<<> B
><<B C
(<<C D
)<<D E
;<<E F
session== 
.== 
cToken== 
=== 
jwtUtil== $
.==$ %
	signToken==% .
(==. /
user==/ 3
)==3 4
;==4 5
return>> 
session>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
LoggingAA !
>AA! "
LogFrontEndToFileAA# 4
(AA4 5
LoggingAA5 <
loggingAA= D
)AAD E
{BB 	
HttpResponseMessageCC 
responseCC  (
=CC) *
awaitCC+ 0
clientCC1 7
.CC7 8
httpCC8 <
(CC< =
nullCC= A
)CCA B
.DD 
PostAsJsonAsyncDD  
(DD  !
$strDD! l
,DDl m
loggingDDn u
)DDu v
;DDv w
LoggingEE 
resultsEE 
=EE 
awaitEE #
responseEE$ ,
.EE, -
ContentEE- 4
.EE4 5
ReadAsAsyncEE5 @
<EE@ A
LoggingEEA H
>EEH I
(EEI J
)EEJ K
;EEK L
returnFF 
resultsFF 
;FF 
}GG 	
}HH 
}II ﬂ$
TC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Startup.cs
	namespace 	
AwsImgRekCSharp
 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Startup 
{ 
public   
Startup   
(   
IConfiguration   %
configuration  & 3
)  3 4
{!! 	
Configuration"" 
="" 
configuration"" )
;"") *
}## 	
public%% 
IConfiguration%% 
Configuration%% +
{%%, -
get%%. 1
;%%1 2
}%%3 4
public(( 
void(( 
ConfigureServices(( %
(((% &
IServiceCollection((& 8
services((9 A
)((A B
{)) 	
services** 
.** 
	AddScoped** 
<** 
	VaultUtil** (
>**( )
(**) *
)*** +
;**+ ,
services++ 
.++ 
AddAuthentication++ &
(++& '
$str++' 2
)++2 3
.,, 
	AddScheme,, 
<,, '
AuthenticationSchemeOptions,, 6
,,,6 7
RestAuthHandler,,8 G
>,,G H
(,,H I
$str,,I T
,,,T U
null,,V Z
),,Z [
;,,[ \
services-- 
.-- 
	AddScoped-- 
<-- 
JwtUtil-- &
>--& '
(--' (
)--( )
;--) *
services.. 
... 
AddControllers.. #
(..# $
)..$ %
;..% &
services// 
.// 
	AddScoped// 
<// 
HttpClientBuilder// 0
>//0 1
(//1 2
)//2 3
;//3 4
services00 
.00 
	AddScoped00 
<00 
UserService00 *
>00* +
(00+ ,
)00, -
;00- .
services11 
.11 
	AddScoped11 
<11 
FileUtil11 '
>11' (
(11( )
)11) *
;11* +
services22 
.22 
AddSwaggerGen22 "
(22" #
options22# *
=>22+ -
{33 
options44 
.44 

SwaggerDoc44 "
(44" #
$str44# '
,44' (
new44) ,
Info44- 1
{442 3
Title444 9
=44: ;
$str44< E
,44E F
Version44G N
=44O P
$str44Q U
}44V W
)44W X
;44X Y
}55 
)55 
;55 
}66 	
public99 
void99 
	Configure99 
(99 
IApplicationBuilder99 1
app992 5
,995 6
IWebHostEnvironment997 J
env99K N
)99N O
{:: 	
if;; 
(;; 
env;; 
.;; 
IsDevelopment;; !
(;;! "
);;" #
);;# $
{<< 
app== 
.== %
UseDeveloperExceptionPage== -
(==- .
)==. /
;==/ 0
}>> 
app@@ 
.@@ 

UseRouting@@ 
(@@ 
)@@ 
;@@ 
appBB 
.BB 
UseAuthenticationBB !
(BB! "
)BB" #
;BB# $
appDD 
.DD 
UseAuthorizationDD  
(DD  !
)DD! "
;DD" #
appFF 
.FF 
UseCorsFF 
(FF 
optionsFF 
=>FF  "
optionsFF# *
.FF* +
AllowAnyOriginFF+ 9
(FF9 :
)FF: ;
.FF; <
AllowAnyHeaderFF< J
(FFJ K
)FFK L
.FFL M
AllowAnyMethodFFM [
(FF[ \
)FF\ ]
)FF] ^
;FF^ _
appHH 
.HH 
UseEndpointsHH 
(HH 
	endpointsHH &
=>HH' )
{II 
	endpointsJJ 
.JJ 
MapControllersJJ (
(JJ( )
)JJ) *
;JJ* +
}KK 
)KK 
;KK 
appMM 
.MM 

UseSwaggerMM 
(MM 
)MM 
;MM 
appOO 
.OO 
UseSwaggerUIOO 
(OO 
optionsOO $
=>OO% '
{PP 
optionsQQ 
.QQ 
SwaggerEndpointQQ '
(QQ' (
$strQQ( B
,QQB C
$strQQD L
)QQL M
;QQM N
}RR 
)RR 
;RR 
}SS 	
}TT 
internalVV 
classVV 
InfoVV 
:VV 
OpenApiInfoVV %
{WW 
}XX 
}YY ∆
_C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Utilities\FileUtil.cs
	namespace 	
AwsImgRekCSharp
 
. 
	Utilities #
{ 
public 

class 
FileUtil 
{ 
private 
readonly 
Settings !
settings" *
;* +
public 
FileUtil 
( 
	VaultUtil !
	vaultUtil" +
)+ ,
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
string 
setFile 
( 
string $
fileName% -
)- .
{ 	
Console 
. 
	WriteLine 
( 
settings &
.& '
getPath' .
(. /
)/ 0
)0 1
;1 2
if 
( 
! 
	Directory 
. 
Exists !
(! "
settings" *
.* +
getPath+ 2
(2 3
)3 4
)4 5
)5 6
{ 
	Directory 
. 
CreateDirectory )
() *
settings* 2
.2 3
getPath3 :
(: ;
); <
)< =
;= >
} 
string 
SaveAs 
= 
Path  
.  !
Combine! (
(( )
settings) 1
.1 2
getPath2 9
(9 :
): ;
,; <
fileName= E
+F G
settingsH P
.P Q
	extentionQ Z
)Z [
;[ \
return 
SaveAs 
; 
} 	
public $
MultipartFormDataContent '
getFormData( 3
(3 4
string4 :
fileName; C
)C D
{ 	
string   
file   
=   
Path   
.   
Combine   &
(  & '
settings  ' /
.  / 0
getPath  0 7
(  7 8
)  8 9
,  9 :
fileName  ; C
+  D E
settings  F N
.  N O
	extention  O X
)  X Y
;  Y Z
byte!! 
[!! 
]!! 
data!! 
=!! 
File!! 
.!! 
ReadAllBytes!! +
(!!+ ,
file!!, 0
)!!0 1
;!!1 2$
MultipartFormDataContent## $
form##% )
=##* +
new##, /$
MultipartFormDataContent##0 H
(##H I
)##I J
;##J K
HttpContent$$ 
content$$ 
=$$  !
new$$" %
ByteArrayContent$$& 6
($$6 7
data$$7 ;
)$$; <
;$$< =
content%% 
.%% 
Headers%% 
.%% 
ContentDisposition%% .
=%%/ 0
new%%1 4)
ContentDispositionHeaderValue%%5 R
(%%R S
settings%%S [
.%%[ \
	formvalue%%\ e
)%%e f
{&& 
Name'' 
='' 
settings'' 
.''  
formtype''  (
,''( )
FileName(( 
=(( 
fileName(( #
+(($ %
settings((& .
.((. /
	extention((/ 8
})) 
;)) 
form** 
.** 
Add** 
(** 
content** 
)** 
;** 
return++ 
form++ 
;++ 
},, 	
}-- 
}.. ¨#
^C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Utilities\JwtUtil.cs
	namespace 	
AwsImgRekCSharp
 
. 
	Utilities #
{ 
public 

class 
JwtUtil 
{ 
private 
readonly 
Settings !
settings" *
;* +
public 
JwtUtil 
( 
	VaultUtil  
	vaultUtil! *
)* +
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
string 
	signToken 
(  
User  $
user% )
)) *
{ 	
byte 
[ 
] 
key 
= 
Encoding !
.! "
ASCII" '
.' (
GetBytes( 0
(0 1
settings1 9
.9 :
	secretKey: C
)C D
;D E#
SecurityTokenDescriptor #
tokenDescriptor$ 3
=4 5
new6 9#
SecurityTokenDescriptor: Q
{ 
Subject 
= 
new 
ClaimsIdentity ,
(, -
new- 0
Claim1 6
[6 7
]7 8
{ 
new 
Claim 
( 

ClaimTypes (
.( )
Name) -
,- .
user/ 3
.3 4
role4 8
)8 9
}   
)   
,   
Expires!! 
=!! 
DateTime!! "
.!!" #
UtcNow!!# )
.!!) *
AddHours!!* 2
(!!2 3
$num!!3 4
)!!4 5
,!!5 6
SigningCredentials"" "
=""# $
new""% (
SigningCredentials"") ;
(""; <
new##  
SymmetricSecurityKey## ,
(##, -
key##- 0
)##0 1
,##1 2
SecurityAlgorithms$$ &
.$$& '
HmacSha256Signature$$' :
)%% 
}&& 
;&& 
var'' 
token'' 
='' 
getTokenHandler'' '
(''' (
)''( )
.'') *
CreateToken''* 5
(''5 6
tokenDescriptor''6 E
)''E F
;''F G
return(( 
getTokenHandler(( "
(((" #
)((# $
.(($ %

WriteToken((% /
(((/ 0
token((0 5
)((5 6
;((6 7
})) 	
public++ 
Boolean++ 
validateToken++ $
(++$ %
string++% +
token++, 1
)++1 2
{,, 	
SecurityToken-- 

validToken-- $
;--$ %
ClaimsPrincipal.. 
	principal.. %
=..& '
getTokenHandler..( 7
(..7 8
)..8 9
.// 
ValidateToken// 
(// 
token// $
,//$ %
getParameters//& 3
(//3 4
)//4 5
,//5 6
out//7 :

validToken//; E
)//E F
;//F G
return00 
true00 
;00 
}11 	
private33 #
JwtSecurityTokenHandler33 '
getTokenHandler33( 7
(337 8
)338 9
{44 	
return55 
new55 #
JwtSecurityTokenHandler55 .
(55. /
)55/ 0
;550 1
}66 	
private77 %
TokenValidationParameters77 )
getParameters77* 7
(777 8
)778 9
{88 	
byte99 
[99 
]99 
key99 
=99 
Encoding99 !
.99! "
ASCII99" '
.99' (
GetBytes99( 0
(990 1
settings991 9
.999 :
	secretKey99: C
)99C D
;99D E
return:: 
new:: %
TokenValidationParameters:: 0
{;; 
ValidateLifetime<<  
=<<! "
false<<# (
,<<( )
ValidateAudience==  
===! "
false==# (
,==( )
ValidateIssuer>> 
=>>  
false>>! &
,>>& '
IssuerSigningKey??  
=??! "
new??# & 
SymmetricSecurityKey??' ;
(??; <
key??< ?
)??? @
}@@ 
;@@ 
}AA 	
}BB 
}CC É
`C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Utilities\VaultUtil.cs
	namespace		 	
AwsImgRekCSharp		
 
.		 
	Utilities		 #
{

 
public 

class 
	VaultUtil 
{ 
private 
string 
key 
= 
$str l
;l m
private 
string 

encryption !
=" #
$str$ u
;u v
public 
T 
decrypt 
< 
T 
> 
( 
) 
{ 	
byte 
[ 
] 
iv 
= 
new 
byte  
[  !
$num! #
]# $
;$ %
byte 
[ 
] 
buffer 
= 
File  
.  !
ReadAllBytes! -
(- .

encryption. 8
)8 9
;9 :
string 
content 
; 
using 
( 
Aes 
aes 
= 
Aes  
.  !
Create! '
(' (
)( )
)) *
{ 
aes 
. 
Key 
= 
File 
. 
ReadAllBytes +
(+ ,
key, /
)/ 0
;0 1
aes 
. 
IV 
= 
iv 
; 
ICryptoTransform  
	decryptor! *
=+ ,
aes- 0
.0 1
CreateDecryptor1 @
(@ A
aesA D
.D E
KeyE H
,H I
aesJ M
.M N
IVN P
)P Q
;Q R
using 
( 
MemoryStream #
memory$ *
=+ ,
new- 0
MemoryStream1 =
(= >
buffer> D
)D E
)E F
{   
using!! 
(!! 
CryptoStream!! '
cryptoStream!!( 4
=!!5 6
new!!7 :
CryptoStream!!; G
(!!G H
memory!!H N
,!!N O
	decryptor!!P Y
,!!Y Z
CryptoStreamMode!![ k
.!!k l
Read!!l p
)!!p q
)!!q r
{"" 
using## 
(## 
StreamReader## +
streamReader##, 8
=##9 :
new##; >
StreamReader##? K
(##K L
cryptoStream##L X
)##X Y
)##Y Z
{$$ 
content%% #
=%%$ %
streamReader%%& 2
.%%2 3
	ReadToEnd%%3 <
(%%< =
)%%= >
;%%> ?
}&& 
return'' "
jsonStringDeserializer'' 5
<''5 6
T''6 7
>''7 8
(''8 9
content''9 @
)''@ A
;''A B
}(( 
})) 
}** 
}++ 	
private11 
T11 "
jsonStringDeserializer11 (
<11( )
T11) *
>11* +
(11+ ,
string11, 2
json113 7
)117 8
{22 	
return33 
JsonSerializer33 !
.33! "
Deserialize33" -
<33- .
T33. /
>33/ 0
(330 1
json331 5
)335 6
;336 7
}44 	
}55 
}66 