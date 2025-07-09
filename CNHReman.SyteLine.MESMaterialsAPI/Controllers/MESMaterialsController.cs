using CNHReman.SyteLine.MESMaterialsAPI.Models;
using CNHReman.SyteLine.MESMaterialsAPI.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.AspNetCore.Authorization;
using CNHReman.SyteLine.MESMaterialsAPI.IRepository;

namespace CNHReman.SyteLine.MESMaterialsAPI.Controllers
{
    /// <summary>
    /// This class handles the endpoints related to MESMaterials, or the materials Ujigami displays in their Work Instructions
    /// </summary>
    [ApiController]
    [Route("[controller]")]
    public class MESMaterialsController : ControllerBase
    {
        private readonly ILogger<MESMaterialsController> _logger;
        private APIKeyHelper _apiKeyHelper; // implements the API Key auth
        private IMESMaterialsAccess _matlsAccess; // provides an interface to access MES materials information

        public MESMaterialsController(ILogger<MESMaterialsController> logger, IInternalAPIAccess _internalAPIAccess, IMESMaterialsAccess _materialsAccess)
        {
            _logger = logger;
            _apiKeyHelper = new APIKeyHelper(_internalAPIAccess);
            _matlsAccess = _materialsAccess;

        }

        /// <summary>
        /// This is the "entry point" for a GET endpoint to get CurrentMaterials information for a job
        /// given the item number and serial number for the job
        /// </summary>
        /// <param name="itemno">The item number</param>
        /// <param name="serialno">The serial number (for a serial tracked item)</param>
        /// <returns>An object with HTTP status information and, if relevant, a list of materials information.</returns>
        [HttpGet]
        public ActionResult<ApiResponseModel<List<MESMaterial>>> GetMESMaterials([FromQuery] string itemno, [FromQuery] string serialno)
        {
            // init the return object
            List<MESMaterial> matls = new List<MESMaterial>();
            // get the API key from the header
            string? key = Request.Headers[Constants.API_KEY_HEADER];

            try
            {
                //if there is no key on the request, Status 400 - Bad Request
                if (string.IsNullOrWhiteSpace(key))
                    return BadRequest();

                // check the key is a valid key
                if (_apiKeyHelper.IsValidKey(key))
                {
                    // get the materials
                    matls = _matlsAccess.GetMaterialsForItem(itemno, serialno);

                    // if no materials were found for the item and serial
                    if (matls.Count == 0)
                    {
                        // Return 404 Not Found with a JSON object containing the message
                        return NotFound(new ApiResponseModel<List<MESMaterial>>
                        {
                            StatusCode = 404,
                            Success = false,
                            Message = $"No MES Materials found for itemno: {itemno} and serialno: {serialno}",
                            Data = null
                        });
                    }

                    return Ok(new ApiResponseModel<List<MESMaterial>>
                    {
                        StatusCode = 200,
                        Success = true,
                        Message = "Success",
                        Data = matls
                    });
                }
                else
                {
                    // Wrong key
                    return Unauthorized(new ApiResponseModel<List<MESMaterial>>
                    {
                        StatusCode = 401,
                        Success = false,
                        Message = "Unauthorized",
                        Data = null
                    }); // status 401
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return StatusCode(StatusCodes.Status500InternalServerError, new ApiResponseModel<string>
                {
                    StatusCode = 500,
                    Success = false,
                    Data = "",// Data = ex.Message,
                    Message = "Internal Server Error"
                }); // status 500
            }
        }
    }
}
