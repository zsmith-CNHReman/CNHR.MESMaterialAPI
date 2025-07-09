namespace CNHReman.SyteLine.MESMaterialsAPI.Models
{
    /// <summary>
    /// This is an easy generic class for consistent API response format
    /// It is converted to JSON and served for our responses
    /// </summary>
    /// <typeparam name="T">The type represented in the "Data" field</typeparam>
    public class ApiResponseModel<T>
    {
        public int StatusCode { get; set; }
        public bool Success { get; set; }
        public string Message { get; set; }
        public T? Data { get; set; }
    }
}
