namespace CNHReman.SyteLine.MESMaterialsAPI.IRepository
{
    /// <summary>
    /// This interface describes the methods needed for BuildStatus-related data access, in reference to Ujigami's UET "MES Build Complete Date"
    /// so that we can swap out the implementations of this access without updating the business or routing logic
    /// For instance: switching to using some other UET or Build Completion validation logic
    /// </summary>
    public interface IMESBuildStatusAccess
    {
        /// <summary>
        /// This method is meant to set the MES Complete Date on a job 
        /// given the item and serial-tracked serial number
        /// </summary>
        /// <param name="itemno">The part number</param>
        /// <param name="serialno">The serial tracked serial number</param>
        /// <returns>
        /// A CompletionResult enum indicating the status from the update
        /// </returns>
        public CompletionResult CompleteMesBuild(string itemno, string serialno, int reverse = 0);
    }

    // This enum provides us a nice, strongly typed, way to return the status of the Update
    // so the controller can assign the right status codes
    public enum CompletionResult
    {
        Success,
        Failure,
        Error
    }
}
