using AwsImgRekCSharp.Configurations;
using AwsImgRekCSharp.Models;
using AwsImgRekCSharp.Utilities;
using System.Net.Http;
using System.Threading.Tasks;

namespace AwsImgRekCSharp.Services
{
    /// <summary>The main provider of the application</summary>
    public class UserService
    {
        private readonly Settings settings;
        private readonly JwtUtil jwtUtil;       
        private readonly HttpClientBuilder client;
        private readonly FileUtil fileUtil;
        /// <summary>Initializes a new instance of the <see cref="UserService" /> class.</summary>
        /// <param name="jwtUtil">The JWT utility.</param>
        /// <param name="vaultUtil">The vault utility.</param>
        /// <param name="client">The client.</param>
        /// <param name="fileUtil">The file utility.</param>
        public UserService(
            JwtUtil jwtUtil,
            VaultUtil vaultUtil, 
            HttpClientBuilder client, 
            FileUtil fileUtil
            )
        {
            settings = vaultUtil.decrypt<Settings>();
            this.jwtUtil = jwtUtil;     
            this.client = client;
            this.fileUtil = fileUtil;
        }
        /// <summary>
        /// Sends a http post request to a java service and compares 
        /// the faces results only if JWT token is valid.
        /// </summary>
        /// <param name="faces">The faces.</param>
        /// <param name="token">The token.</param>
        /// <returns>Results and compared faces in poco</returns>
        public async Task<Compare> CompareFacesResults(Compare faces, string token)
        {
            HttpResponseMessage response = await client.http(token)
                .PostAsJsonAsync(settings.compareUrl, faces);
            faces = await response.Content.ReadAsAsync<Compare>();
            return faces;
        }
        /// <summary>
        /// Sends a http post request to a java service and processes 
        /// the uploaded file only if JWT token is valid
        /// </summary>
        /// <param name="fileName">Name of the file.</param>
        /// <param name="token">The token.</param>
        /// <returns>The image uploaded and success details in poco</returns>
        public async Task<Upload> ProcessUpload(string fileName, string token)
        {
            MultipartFormDataContent form = fileUtil.getFormData(fileName);

            HttpResponseMessage response = await client.http(token)
                .PostAsync(settings.uploadUrl + fileName, form);
            Upload process = await response.Content.ReadAsAsync<Upload>();
            return process;
        }

        /// <summary>Validates token.</summary>
        /// <param name="token">The token.</param>
        /// <returns>flag depending on if token is valid or not</returns>
        public bool TokenAuthenticated(string token)
        {
            return jwtUtil.validateToken(token);
        }

        /// <summary>
        /// Provides a token from the C# application and sends a 
        /// http post request to a java service to request a token from the 
        /// Java application.
        /// </summary>
        /// <param name="user">The user.</param>
        /// <returns>C# and Java JWT tokens in poco</returns>
        public async Task<User> Authenticate(User user)
        {
            HttpResponseMessage response = await client.http(null)
                .PostAsJsonAsync(settings.sessionUrl, user);
            User session = await response.Content.ReadAsAsync<User>();
            session.cToken = jwtUtil.signToken(user);
            return session;
        }

        /// <summary>
        /// Sends a http post request to a java service of logs from the 
        /// front end only if JWT token is valid
        /// </summary>
        /// <param name="logging">The logs.</param>
        /// <returns>Success message in poco</returns>
        public async Task<Logging> LogFrontEndToFile(Logging logging)
        {
            HttpResponseMessage response = await client.http(null)
                .PostAsJsonAsync(settings.logUrl, logging);
            Logging results = await response.Content.ReadAsAsync<Logging>();
            return results;
        }
    }
}
