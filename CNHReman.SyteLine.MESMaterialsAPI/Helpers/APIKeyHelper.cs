using CNHReman.SyteLine.MESMaterialsAPI.IRepository;

namespace CNHReman.SyteLine.MESMaterialsAPI.Helpers
{
    /// <summary>
    /// This class leverages an IInternalAPIAccess interface
    /// to provide an implementation for controller methods to validate the API Key
    /// </summary>
    public class APIKeyHelper
    {
        private IInternalAPIAccess _internalAPIAccess; // dal interface

        public APIKeyHelper(IInternalAPIAccess internalAPIAccess)
        {
            _internalAPIAccess = internalAPIAccess;
        }

        public bool IsValidKey(string key)
        {
            return _internalAPIAccess.IsKeyValid(key);
        }
    }
}
