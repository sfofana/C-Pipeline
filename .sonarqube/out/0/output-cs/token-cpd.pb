è
mC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Configurations\HttpClientBuilder.cs
	namespace 	
AwsImgRekCSharp
 
. 
Configurations (
{ 
public 

class 
HttpClientBuilder "
{ 
private 
readonly 
Settings !
settings" *
;* +
public 
HttpClientBuilder  
(  !
	VaultUtil! *
	vaultUtil+ 4
)4 5
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
} 	
public 

HttpClient 
http 
( 
string %
token& +
)+ ,
{ 	

HttpClient 
client 
= 
new  #

HttpClient$ .
(. /
)/ 0
;0 1%
AuthenticationHeaderValue %
	authValue& /
=0 1
new %
AuthenticationHeaderValue -
(- .
$str. 5
,5 6
Convert7 >
.> ?
ToBase64String? M
(M N
Encoding 
. 
UTF8 !
.! "
GetBytes" *
(* +
$"+ -
{- .
settings. 6
.6 7
username7 ?
}? @
:@ A
{A B
settingsB J
.J K
passwordK S
}S T
"T U
)U V
) 
) 
; 
client 
. !
DefaultRequestHeaders (
.( )
Authorization) 6
=7 8
	authValue9 B
;B C
client   
.   !
DefaultRequestHeaders   (
.  ( )
Add  ) ,
(  , -
$str  - 5
,  5 6
$str  7 @
+  A B
token  C H
)  H I
;  I J
return!! 
client!! 
;!! 
}"" 	
}## 
}$$ Œ0
kC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Configurations\RestAuthHandler.cs
	namespace 	
AwsImgRekCSharp
 
. 
Configurations (
{ 
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
public 
RestAuthHandler 
( 
	VaultUtil 
	vaultUtil 
,  
IOptionsMonitor   
<   '
AuthenticationSchemeOptions   7
>  7 8
options  9 @
,  @ A
ILoggerFactory!! 
logger!! !
,!!! "

UrlEncoder"" 
encoder"" 
,"" 
ISystemClock## 
clock## 
,## 
UserService$$ 
service$$ 
)%% 
:&& 
base&& 
(&& 
options&& 
,&& 
logger&& "
,&&" #
encoder&&$ +
,&&+ ,
clock&&- 2
)&&2 3
{'' 	
credentials(( 
=(( 
	vaultUtil(( #
.((# $
decrypt(($ +
<((+ ,
Credentials((, 7
>((7 8
(((8 9
)((9 :
;((: ;
this)) 
.)) 
service)) 
=)) 
service)) "
;))" #
}** 	
	protected-- 
override-- 
async--  
Task--! %
<--% &
AuthenticateResult--& 8
>--8 9#
HandleAuthenticateAsync--: Q
(--Q R
)--R S
{.. 	
string// 
username// 
;// 
string00 
password00 
;00 
if22 
(22 
!22 
Request22 
.22 
Headers22  
.22  !
ContainsKey22! ,
(22, -
$str22- <
)22< =
)22= >
return33 
AuthenticateResult33 )
.33) *
Fail33* .
(33. /
$str33/ >
)33> ?
;33? @
if55 
(55 
!55 
Request55 
.55 
Headers55  
.55  !
ContainsKey55! ,
(55, -
$str55- 5
)555 6
)556 7
return66 
AuthenticateResult66 )
.66) *
Fail66* .
(66. /
$str66/ >
)66> ?
;66? @
try88 
{99 
var:: 

authHeader:: 
=::  %
AuthenticationHeaderValue::! :
.::: ;
Parse::; @
(::@ A
Request::A H
.::H I
Headers::I P
[::P Q
$str::Q `
]::` a
)::a b
;::b c
var;; 
credentialBytes;; #
=;;$ %
Convert;;& -
.;;- .
FromBase64String;;. >
(;;> ?

authHeader;;? I
.;;I J
	Parameter;;J S
);;S T
;;;T U
string<< 
[<< 
]<< 
userCredentials<< (
=<<) *
Encoding<<+ 3
.<<3 4
UTF8<<4 8
.<<8 9
	GetString<<9 B
(<<B C
credentialBytes<<C R
)<<R S
.<<S T
Split<<T Y
(<<Y Z
$str<<Z ]
)<<] ^
;<<^ _
username== 
=== 
userCredentials== *
[==* +
$num==+ ,
]==, -
;==- .
password>> 
=>> 
userCredentials>> *
[>>* +
$num>>+ ,
]>>, -
;>>- .
var@@ 
tokenHeader@@ 
=@@  !%
AuthenticationHeaderValue@@" ;
.@@; <
Parse@@< A
(@@A B
Request@@B I
.@@I J
Headers@@J Q
[@@Q R
$str@@R Z
]@@Z [
)@@[ \
;@@\ ]
stringAA 
tokenAA 
=AA 
tokenHeaderAA *
.AA* +
	ParameterAA+ 4
;AA4 5
ifCC 
(CC 
usernameCC 
!=CC 
credentialsCC  +
.CC+ ,
usernameCC, 4
||CC5 7
passwordDD 
!=DD 
credentialsDD  +
.DD+ ,
passwordDD, 4
||DD5 7
!EE 
serviceEE 
.EE 
TokenAuthenticatedEE /
(EE/ 0
tokenEE0 5
)EE5 6
)FF 
returnHH 
AuthenticateResultHH -
.HH- .
FailHH. 2
(HH2 3
$strHH3 B
)HHB C
;HHC D
elseII 
{JJ 
varKK 
claimsKK 
=KK  
newKK! $
[KK$ %
]KK% &
{KK' (
newKK) ,
ClaimKK- 2
(KK2 3

ClaimTypesKK3 =
.KK= >
NameKK> B
,KKB C
usernameKKD L
)KKL M
}KKN O
;KKO P
varLL 
identityLL  
=LL! "
newLL# &
ClaimsIdentityLL' 5
(LL5 6
claimsLL6 <
,LL< =
SchemeLL> D
.LLD E
NameLLE I
)LLI J
;LLJ K
varMM 
	principalMM !
=MM" #
newMM$ '
ClaimsPrincipalMM( 7
(MM7 8
identityMM8 @
)MM@ A
;MMA B
varNN 
ticketNN 
=NN  
newNN! $ 
AuthenticationTicketNN% 9
(NN9 :
	principalNN: C
,NNC D
SchemeNNE K
.NNK L
NameNNL P
)NNP Q
;NNQ R
returnOO 
AuthenticateResultOO -
.OO- .
SuccessOO. 5
(OO5 6
ticketOO6 <
)OO< =
;OO= >
}PP 
}RR 
catchSS 
{TT 
returnUU 
AuthenticateResultUU )
.UU) *
FailUU* .
(UU. /
$strUU/ M
)UUM N
;UUN O
}VV 
}XX 	
}YY 
}ZZ ∑
dC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Configurations\Settings.cs
	namespace 	
AwsImgRekCSharp
 
. 
Configurations (
{ 
public 

class 
Settings 
{ 
public

 
string

 
	secretKey

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string 
username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

sessionUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 

compareUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
	uploadUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
logUrl 
{ 
get "
;" #
set$ '
;' (
}) *
public!! 
string!! 
	directory!! 
{!!  !
get!!" %
;!!% &
set!!' *
;!!* +
}!!, -
public$$ 
string$$ 
folder$$ 
{$$ 
get$$ "
;$$" #
set$$$ '
;$$' (
}$$) *
public'' 
string'' 
	extention'' 
{''  !
get''" %
;''% &
set''' *
;''* +
}'', -
public** 
string** 
	formvalue** 
{**  !
get**" %
;**% &
set**' *
;*** +
}**, -
public-- 
string-- 
formtype-- 
{--  
get--! $
;--$ %
set--& )
;--) *
}--+ ,
public00 
string00 
getPath00 
(00 
)00 
{11 	
return22 
Path22 
.22 
Combine22 
(22  
	directory22  )
,22) *
folder22+ 1
)221 2
;222 3
}33 	
}44 
}55 ÿ
qC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Controllers\AuthenticationController.cs
	namespace 	
AwsImgRekCSharp
 
. 
Controllers %
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class $
AuthenticationController )
:* +
ControllerBase, :
{ 
private 
readonly 
UserService $
service% ,
;, -
public $
AuthenticationController '
(' (
UserService( 3
service4 ;
); <
{ 	
this 
. 
service 
= 
service "
;" #
} 	
[ 	
HttpPost	 
( 
$str  
)  !
]! "
public 
async 
Task 
< 
User 
> 
	GetAccess  )
() *
[* +
FromBody+ 3
]3 4
User5 9
user: >
)> ?
{ 	
return 
await 
service  
.  !
Authenticate! -
(- .
user. 2
)2 3
;3 4
} 	
[!! 	
HttpPost!!	 
(!! 
$str!! 
)!! 
]!! 
public"" 
async"" 
Task"" 
<"" 
Logging"" !
>""! "
FrontEndLogs""# /
(""/ 0
[""0 1
FromBody""1 9
]""9 :
Logging""; B
logging""C J
)""J K
{## 	
return$$ 
await$$ 
service$$  
.$$  !
LogFrontEndToFile$$! 2
($$2 3
logging$$3 :
)$$: ;
;$$; <
}%% 	
}&& 
}'' ˘
gC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Controllers\UserController.cs
	namespace

 	
AwsImgRekCSharp


 
.

 
Controllers

 %
{ 
[ 
	Authorize 
] 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
private 
readonly 
UserService $
service% ,
;, -
private 
readonly 
FileUtil !
fileUtil" *
;* +
public 
UserController 
( 
UserService 
service 
,  
FileUtil 
fileUtil 
) 
{ 	
this 
. 
service 
= 
service "
;" #
this 
. 
fileUtil 
= 
fileUtil $
;$ %
} 	
[## 	
HttpPost##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
Compare$$ !
>$$! "
CompareFaces$$# /
($$/ 0
[$$0 1
FromBody$$1 9
]$$9 :
Compare$$; B
faces$$C H
)$$H I
{%% 	
return&& 
await&& 
service&&  
.&&  !
CompareFacesResults&&! 4
(&&4 5
faces&&5 :
,&&: ;
getToken&&< D
(&&D E
)&&E F
)&&F G
;&&G H
}'' 	
[,, 	
HttpPost,,	 
(,, 
$str,, !
),,! "
],," #
public-- 
async-- 
Task-- 
<-- 
Upload--  
>--  !
Upload--" (
(--( )
string--) /
name--0 4
)--4 5
{.. 	
var// 
file// 
=// 
Request// 
.// 
Form// #
.//# $
Files//$ )
[//) *
$num//* +
]//+ ,
;//, -
if00 
(00 
file00 
.00 
Length00 
>00 
$num00 
)00  
{11 
string22 
SaveAs22 
=22 
fileUtil22  (
.22( )
setFile22) 0
(220 1
name221 5
)225 6
;226 7
using33 
(33 
var33 
stream33 !
=33" #
new33$ '

FileStream33( 2
(332 3
SaveAs333 9
,339 :
FileMode33; C
.33C D
Create33D J
)33J K
)33K L
{44 
file55 
.55 
CopyTo55 
(55  
stream55  &
)55& '
;55' (
}66 
}77 
return88 
await88 
service88  
.88  !
ProcessUpload88! .
(88. /
name88/ 3
,883 4
getToken885 =
(88= >
)88> ?
)88? @
;88@ A
}99 	
private== 
string== 
getToken== 
(==  
)==  !
{>> 	
var?? 
tokenHeader?? 
=?? %
AuthenticationHeaderValue?? 7
.??7 8
Parse??8 =
(??= >
Request??> E
.??E F
Headers??F M
[??M N
$str??N V
]??V W
)??W X
;??X Y
return@@ 
tokenHeader@@ 
.@@ 
	Parameter@@ (
;@@( )
}AA 	
}CC 
}DD ü
[C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Compare.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public 

class 
Compare 
{ 
public

 
List

 
<

 
string

 
>

 
names

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
List 
< 
string 
> 
images "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
List 
< 
string 
> 
details #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
double 
results 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} É
_C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Credentials.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public 

class 
Credentials 
{ 
public 
string 
	secretKey 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ¡
[C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Logging.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public 

class 
Logging 
{ 
public 
string 
message 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 
ZC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\Upload.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public 

class 
Upload 
{ 
public 
string 
name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
process 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
image 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ï
XC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Models\User.cs
	namespace 	
AwsImgRekCSharp
 
. 
Models  
{ 
public 

class 
User 
{ 
public 
string 
cToken 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
jToken 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ‹
TC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Program.cs
	namespace 	
AwsImgRekCSharp
 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public		 

class		 
Program		 
{

 
	protected 
Program 
( 
) 
{ 	
} 	
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
}   
}!! Â/
aC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Services\UserService.cs
	namespace 	
AwsImgRekCSharp
 
. 
Services "
{ 
public

 

class

 
UserService

 
{ 
private 
readonly 
Settings !
settings" *
;* +
private 
readonly 
JwtUtil  
jwtUtil! (
;( )
private 
readonly 
HttpClientBuilder *
client+ 1
;1 2
private 
readonly 
FileUtil !
fileUtil" *
;* +
public 
UserService 
( 
JwtUtil 
jwtUtil 
, 
	VaultUtil 
	vaultUtil 
,  
HttpClientBuilder 
client $
,$ %
FileUtil 
fileUtil 
) 
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
this 
. 
jwtUtil 
= 
jwtUtil "
;" #
this 
. 
client 
= 
client  
;  !
this 
. 
fileUtil 
= 
fileUtil $
;$ %
}   	
public(( 
async(( 
Task(( 
<(( 
Compare(( !
>((! "
CompareFacesResults((# 6
(((6 7
Compare((7 >
faces((? D
,((D E
string((F L
token((M R
)((R S
{)) 	
HttpResponseMessage** 
response**  (
=**) *
await**+ 0
client**1 7
.**7 8
http**8 <
(**< =
token**= B
)**B C
.++ 
PostAsJsonAsync++  
(++  !
settings++! )
.++) *

compareUrl++* 4
,++4 5
faces++6 ;
)++; <
;++< =
faces,, 
=,, 
await,, 
response,, "
.,," #
Content,,# *
.,,* +
ReadAsAsync,,+ 6
<,,6 7
Compare,,7 >
>,,> ?
(,,? @
),,@ A
;,,A B
return-- 
faces-- 
;-- 
}.. 	
public66 
async66 
Task66 
<66 
Upload66  
>66  !
ProcessUpload66" /
(66/ 0
string660 6
fileName667 ?
,66? @
string66A G
token66H M
)66M N
{77 	$
MultipartFormDataContent88 $
form88% )
=88* +
fileUtil88, 4
.884 5
getFormData885 @
(88@ A
fileName88A I
)88I J
;88J K
HttpResponseMessage:: 
response::  (
=::) *
await::+ 0
client::1 7
.::7 8
http::8 <
(::< =
token::= B
)::B C
.;; 
	PostAsync;; 
(;; 
settings;; #
.;;# $
	uploadUrl;;$ -
+;;. /
fileName;;0 8
,;;8 9
form;;: >
);;> ?
;;;? @
Upload<< 
process<< 
=<< 
await<< "
response<<# +
.<<+ ,
Content<<, 3
.<<3 4
ReadAsAsync<<4 ?
<<<? @
Upload<<@ F
><<F G
(<<G H
)<<H I
;<<I J
return== 
process== 
;== 
}>> 	
publicCC 
boolCC 
TokenAuthenticatedCC &
(CC& '
stringCC' -
tokenCC. 3
)CC3 4
{DD 	
returnEE 
jwtUtilEE 
.EE 
validateTokenEE (
(EE( )
tokenEE) .
)EE. /
;EE/ 0
}FF 	
publicOO 
asyncOO 
TaskOO 
<OO 
UserOO 
>OO 
AuthenticateOO  ,
(OO, -
UserOO- 1
userOO2 6
)OO6 7
{PP 	
HttpResponseMessageQQ 
responseQQ  (
=QQ) *
awaitQQ+ 0
clientQQ1 7
.QQ7 8
httpQQ8 <
(QQ< =
nullQQ= A
)QQA B
.RR 
PostAsJsonAsyncRR  
(RR  !
settingsRR! )
.RR) *

sessionUrlRR* 4
,RR4 5
userRR6 :
)RR: ;
;RR; <
UserSS 
sessionSS 
=SS 
awaitSS  
responseSS! )
.SS) *
ContentSS* 1
.SS1 2
ReadAsAsyncSS2 =
<SS= >
UserSS> B
>SSB C
(SSC D
)SSD E
;SSE F
sessionTT 
.TT 
cTokenTT 
=TT 
jwtUtilTT $
.TT$ %
	signTokenTT% .
(TT. /
userTT/ 3
)TT3 4
;TT4 5
returnUU 
sessionUU 
;UU 
}VV 	
public^^ 
async^^ 
Task^^ 
<^^ 
Logging^^ !
>^^! "
LogFrontEndToFile^^# 4
(^^4 5
Logging^^5 <
logging^^= D
)^^D E
{__ 	
HttpResponseMessage`` 
response``  (
=``) *
await``+ 0
client``1 7
.``7 8
http``8 <
(``< =
null``= A
)``A B
.aa 
PostAsJsonAsyncaa  
(aa  !
settingsaa! )
.aa) *
logUrlaa* 0
,aa0 1
loggingaa2 9
)aa9 :
;aa: ;
Loggingbb 
resultsbb 
=bb 
awaitbb #
responsebb$ ,
.bb, -
Contentbb- 4
.bb4 5
ReadAsAsyncbb5 @
<bb@ A
LoggingbbA H
>bbH I
(bbI J
)bbJ K
;bbK L
returncc 
resultscc 
;cc 
}dd 	
}ee 
}ff ﬂ$
TC:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Startup.cs
	namespace 	
AwsImgRekCSharp
 
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public## 
void## 
ConfigureServices## %
(##% &
IServiceCollection##& 8
services##9 A
)##A B
{$$ 	
services%% 
.%% 
	AddScoped%% 
<%% 
	VaultUtil%% (
>%%( )
(%%) *
)%%* +
;%%+ ,
services&& 
.&& 
AddAuthentication&& &
(&&& '
$str&&' 2
)&&2 3
.'' 
	AddScheme'' 
<'' '
AuthenticationSchemeOptions'' 6
,''6 7
RestAuthHandler''8 G
>''G H
(''H I
$str''I T
,''T U
null''V Z
)''Z [
;''[ \
services(( 
.(( 
	AddScoped(( 
<(( 
JwtUtil(( &
>((& '
(((' (
)((( )
;(() *
services)) 
.)) 
AddControllers)) #
())# $
)))$ %
;))% &
services** 
.** 
	AddScoped** 
<** 
HttpClientBuilder** 0
>**0 1
(**1 2
)**2 3
;**3 4
services++ 
.++ 
	AddScoped++ 
<++ 
UserService++ *
>++* +
(+++ ,
)++, -
;++- .
services,, 
.,, 
	AddScoped,, 
<,, 
FileUtil,, '
>,,' (
(,,( )
),,) *
;,,* +
services-- 
.-- 
AddSwaggerGen-- "
(--" #
options--# *
=>--+ -
{.. 
options// 
.// 

SwaggerDoc// "
(//" #
$str//# '
,//' (
new//) ,
Info//- 1
{//2 3
Title//4 9
=//: ;
$str//< E
,//E F
Version//G N
=//O P
$str//Q U
}//V W
)//W X
;//X Y
}00 
)00 
;00 
}11 	
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
	namespace 	
AwsImgRekCSharp
 
. 
	Utilities #
{ 
public

 

class

 
FileUtil

 
{ 
private 
readonly 
Settings !
settings" *
;* +
public 
FileUtil 
( 
	VaultUtil !
	vaultUtil" +
)+ ,
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
string 
setFile 
( 
string $
fileName% -
)- .
{ 	
Console 
. 
	WriteLine 
( 
settings &
.& '
getPath' .
(. /
)/ 0
)0 1
;1 2
if 
( 
! 
	Directory 
. 
Exists !
(! "
settings" *
.* +
getPath+ 2
(2 3
)3 4
)4 5
)5 6
{ 
	Directory 
. 
CreateDirectory )
() *
settings* 2
.2 3
getPath3 :
(: ;
); <
)< =
;= >
} 
string 
SaveAs 
= 
Path  
.  !
Combine! (
(( )
settings) 1
.1 2
getPath2 9
(9 :
): ;
,; <
fileName= E
+F G
settingsH P
.P Q
	extentionQ Z
)Z [
;[ \
return 
SaveAs 
; 
} 	
public## $
MultipartFormDataContent## '
getFormData##( 3
(##3 4
string##4 :
fileName##; C
)##C D
{$$ 	
string%% 
file%% 
=%% 
Path%% 
.%% 
Combine%% &
(%%& '
settings%%' /
.%%/ 0
getPath%%0 7
(%%7 8
)%%8 9
,%%9 :
fileName%%; C
+%%D E
settings%%F N
.%%N O
	extention%%O X
)%%X Y
;%%Y Z
byte&& 
[&& 
]&& 
data&& 
=&& 
File&& 
.&& 
ReadAllBytes&& +
(&&+ ,
file&&, 0
)&&0 1
;&&1 2$
MultipartFormDataContent(( $
form((% )
=((* +
new((, /$
MultipartFormDataContent((0 H
(((H I
)((I J
;((J K
HttpContent)) 
content)) 
=))  !
new))" %
ByteArrayContent))& 6
())6 7
data))7 ;
))); <
;))< =
content** 
.** 
Headers** 
.** 
ContentDisposition** .
=**/ 0
new**1 4)
ContentDispositionHeaderValue**5 R
(**R S
settings**S [
.**[ \
	formvalue**\ e
)**e f
{++ 
Name,, 
=,, 
settings,, 
.,,  
formtype,,  (
,,,( )
FileName-- 
=-- 
fileName-- #
+--$ %
settings--& .
.--. /
	extention--/ 8
}.. 
;.. 
form// 
.// 
Add// 
(// 
content// 
)// 
;// 
return00 
form00 
;00 
}11 	
}22 
}33 È"
^C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Utilities\JwtUtil.cs
	namespace		 	
AwsImgRekCSharp		
 
.		 
	Utilities		 #
{

 
public 

class 
JwtUtil 
{ 
private 
readonly 
Settings !
settings" *
;* +
public 
JwtUtil 
( 
	VaultUtil  
	vaultUtil! *
)* +
{ 	
settings 
= 
	vaultUtil  
.  !
decrypt! (
<( )
Settings) 1
>1 2
(2 3
)3 4
;4 5
} 	
public 
string 
	signToken 
(  
User  $
user% )
)) *
{ 	
byte 
[ 
] 
key 
= 
Encoding !
.! "
ASCII" '
.' (
GetBytes( 0
(0 1
settings1 9
.9 :
	secretKey: C
)C D
;D E#
SecurityTokenDescriptor #
tokenDescriptor$ 3
=4 5
new6 9#
SecurityTokenDescriptor: Q
{ 
Subject 
= 
new 
ClaimsIdentity ,
(, -
new- 0
Claim1 6
[6 7
]7 8
{ 
new   
Claim   
(   

ClaimTypes   (
.  ( )
Name  ) -
,  - .
user  / 3
.  3 4
role  4 8
)  8 9
}!! 
)!! 
,!! 
Expires"" 
="" 
DateTime"" "
.""" #
UtcNow""# )
."") *
AddHours""* 2
(""2 3
$num""3 4
)""4 5
,""5 6
SigningCredentials## "
=### $
new##% (
SigningCredentials##) ;
(##; <
new$$  
SymmetricSecurityKey$$ ,
($$, -
key$$- 0
)$$0 1
,$$1 2
SecurityAlgorithms%% &
.%%& '
HmacSha256Signature%%' :
)&& 
}'' 
;'' 
var(( 
token(( 
=(( 
getTokenHandler(( '
(((' (
)((( )
.(() *
CreateToken((* 5
(((5 6
tokenDescriptor((6 E
)((E F
;((F G
return)) 
getTokenHandler)) "
())" #
)))# $
.))$ %

WriteToken))% /
())/ 0
token))0 5
)))5 6
;))6 7
}** 	
public// 
Boolean// 
validateToken// $
(//$ %
string//% +
token//, 1
)//1 2
{00 	
SecurityToken11 

validToken11 $
;11$ %
getTokenHandler22 
(22 
)22 
.33 
ValidateToken33 
(33 
token33 $
,33$ %
getParameters33& 3
(333 4
)334 5
,335 6
out337 :

validToken33; E
)33E F
;33F G
return44 
true44 
;44 
}55 	
private77 #
JwtSecurityTokenHandler77 '
getTokenHandler77( 7
(777 8
)778 9
{88 	
return99 
new99 #
JwtSecurityTokenHandler99 .
(99. /
)99/ 0
;990 1
}:: 	
private;; %
TokenValidationParameters;; )
getParameters;;* 7
(;;7 8
);;8 9
{<< 	
byte== 
[== 
]== 
key== 
=== 
Encoding== !
.==! "
ASCII==" '
.==' (
GetBytes==( 0
(==0 1
settings==1 9
.==9 :
	secretKey==: C
)==C D
;==D E
return>> 
new>> %
TokenValidationParameters>> 0
{?? 
ValidateLifetime@@  
=@@! "
false@@# (
,@@( )
ValidateAudienceAA  
=AA! "
falseAA# (
,AA( )
ValidateIssuerBB 
=BB  
falseBB! &
,BB& '
IssuerSigningKeyCC  
=CC! "
newCC# & 
SymmetricSecurityKeyCC' ;
(CC; <
keyCC< ?
)CC? @
}DD 
;DD 
}EE 	
}FF 
}GG Ø
`C:\Users\sufya\Documents\Repository\PipeLineC#\C-Pipeline\AwsImgRekCSharp\Utilities\VaultUtil.cs
	namespace 	
AwsImgRekCSharp
 
. 
	Utilities #
{ 
public 

class 
	VaultUtil 
{		 
private

 
readonly

 
string

 
key

  #
=

$ %
$str

& t
;

t u
private 
readonly 
string 

encryption  *
=+ ,
$str- }
;} ~
public 
T 
decrypt 
< 
T 
> 
( 
) 
{ 	
byte 
[ 
] 
iv 
= 
new 
byte  
[  !
$num! #
]# $
;$ %
byte 
[ 
] 
buffer 
= 
File  
.  !
ReadAllBytes! -
(- .

encryption. 8
)8 9
;9 :
string 
content 
; 
using 
( 
Aes 
aes 
= 
Aes  
.  !
Create! '
(' (
)( )
)) *
{ 
aes 
. 
Key 
= 
File 
. 
ReadAllBytes +
(+ ,
key, /
)/ 0
;0 1
aes 
. 
IV 
= 
iv 
; 
ICryptoTransform  
	decryptor! *
=+ ,
aes- 0
.0 1
CreateDecryptor1 @
(@ A
aesA D
.D E
KeyE H
,H I
aesJ M
.M N
IVN P
)P Q
;Q R
using 
( 
MemoryStream #
memory$ *
=+ ,
new- 0
MemoryStream1 =
(= >
buffer> D
)D E
)E F
{ 
using 
( 
CryptoStream '
cryptoStream( 4
=5 6
new7 :
CryptoStream; G
(G H
memoryH N
,N O
	decryptorP Y
,Y Z
CryptoStreamMode[ k
.k l
Readl p
)p q
)q r
{ 
using   
(   
StreamReader   +
streamReader  , 8
=  9 :
new  ; >
StreamReader  ? K
(  K L
cryptoStream  L X
)  X Y
)  Y Z
{!! 
content"" #
=""$ %
streamReader""& 2
.""2 3
	ReadToEnd""3 <
(""< =
)""= >
;""> ?
}## 
return$$ "
jsonStringDeserializer$$ 5
<$$5 6
T$$6 7
>$$7 8
($$8 9
content$$9 @
)$$@ A
;$$A B
}%% 
}&& 
}'' 
}(( 	
private.. 
T.. "
jsonStringDeserializer.. (
<..( )
T..) *
>..* +
(..+ ,
string.., 2
json..3 7
)..7 8
{// 	
return00 
JsonSerializer00 !
.00! "
Deserialize00" -
<00- .
T00. /
>00/ 0
(000 1
json001 5
)005 6
;006 7
}11 	
}22 
}33 