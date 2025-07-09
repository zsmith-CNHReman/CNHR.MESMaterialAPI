using CNHReman.SyteLine.MESMaterialsAPI.Helpers;
using CNHReman.SyteLine.MESMaterialsAPI.IRepository;
using CNHReman.SyteLine.MESMaterialsAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace CNHReman.SyteLine.MESMaterialsAPI.Controllers
{
    /// <summary>
    /// This controller handles all endpoints related to the MES Build Status
    /// </summary>
    [ApiController]
    [Route("[controller]")] // This means that the route name = controller name - "Controller" (MESBuildStatus)
    public class MESBuildStatusController : Controller
    {
        private readonly ILogger<MESMaterialsController> _logger;
        private APIKeyHelper _apiKeyHelper; // Our API Key verifier
        private IMESBuildStatusAccess _buildStatusAccess; // The data access interface for MES Build Statuses

        /// <summary>
        /// No direct references, but is instantiated by the framework
        /// Injects registered interfaces for us
        /// </summary>
        /// <param name="logger">Logger interface</param>
        /// <param name="_internalAPIAccess">API Key access interface</param>
        /// <param name="buildStatusAccess">MES Build Status access interface</param>
        public MESBuildStatusController(ILogger<MESMaterialsController> logger, IInternalAPIAccess _internalAPIAccess, IMESBuildStatusAccess buildStatusAccess)
        {
            _logger = logger;
            _apiKeyHelper = new APIKeyHelper(_internalAPIAccess);
            _buildStatusAccess = buildStatusAccess;
        }

        /// <summary>
        /// This is the "entry-point" for a PUT endpoint that updates the MES Complete Date for an item/serialnumber/job
        /// </summary>
        /// <param name="itemno">Item number of the item whose MES has finished</param>
        /// <param name="serialno">Specific serial number of the previous item</param>
        /// <returns>An object containing HTTP status info and indicates the success of the operation</returns>
        [HttpPut]
        public IActionResult CompleteBuild([FromQuery] string itemno, [FromQuery] string serialno, [FromQuery] int reverse = 0)
        {
            // get the API key from the header
            string? key = Request.Headers[Constants.API_KEY_HEADER];

            try
            {
                // if there is no key on the request, Status 400 - Bad Request
                if (string.IsNullOrWhiteSpace(key))
                    return BadRequest();
                // check the key is a valid key
                if (_apiKeyHelper.IsValidKey(key))
                {
                    if(reverse > 1 || reverse < 0)
                    {
                        return BadRequest(new ApiResponseModel<string>
                        {
                            StatusCode = 400,
                            Success = false,
                            Data = "reverse should be a value: 1, 0, or omitted from the request",
                            Message = "Bad Request"
                        });
                    }


                    // since the key is valid, let's make the update
                    CompletionResult result = _buildStatusAccess.CompleteMesBuild(itemno, serialno, reverse);
                    switch (result)
                    {
                        case CompletionResult.Success:
                            return Ok(new ApiResponseModel<string>
                            {
                                StatusCode = 200,
                                Success = true,
                                Data = $"MES marked {(reverse == 0 ? "complete" : "incomplete")} for item: {itemno} and serial: {serialno}",
                                Message = "Success"
                            });
                        case CompletionResult.Failure:
                            return UnprocessableEntity(new ApiResponseModel<string>
                            {
                                StatusCode = 422,
                                Success = false,
                                Data = $"No MES records were found/updated for item: {itemno} and serial: {serialno}",
                                Message = "Unprocessable - No errors but no updates"
                            });
                        case CompletionResult.Error:
                            return StatusCode(StatusCodes.Status500InternalServerError, new ApiResponseModel<string>
                            {
                                StatusCode = 500,
                                Success = false,
                                Data = "Error finding the resource",// Data = ex.Message,
                                Message = "Internal Server Error"
                            }); // status 500
                        default:
                            return StatusCode(StatusCodes.Status418ImATeapot, new ApiResponseModel<string>
                            {
                                StatusCode = 418,
                                Success = false,
                                Data = "I am a teapot, I do not brew coffee",
                                Message = "Not sure how this happened..."
                            });
                    }
                }
                else
                {
                    // Wrong key
                    return Unauthorized(new ApiResponseModel<string>
                    {
                        StatusCode = 401,
                        Success = false,
                        Message = "Unauthorized",
                        Data = "Unauthorized for this request"
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
