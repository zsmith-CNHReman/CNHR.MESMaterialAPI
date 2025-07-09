namespace CNHReman.SyteLine.MESMaterialsAPI.IRepository
{
    /// <summary>
    /// This interface describes the methods needed for InternalAPI-related data access
    /// so that we can swap out the implementations of this access without updating the business or routing logic
    /// For instance: doing a key vault instead of database access
    /// </summary>
    public interface IInternalAPIAccess
    {
        /// <summary>
        /// This method checks an API key to see if it is valid
        /// </summary>
        /// <param name="key">The API Key from the request</param>
        /// <returns>Wether the API key is valid</returns>
        public bool IsKeyValid(string key);
    }
}
