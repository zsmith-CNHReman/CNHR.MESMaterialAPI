using CNHReman.SyteLine.MESMaterialsAPI.Models;

namespace CNHReman.SyteLine.MESMaterialsAPI.IRepository
{
    /// <summary>
    /// This interface describes the methods needed for Materials-related data access
    /// so that we can swap out the implementations of this access without updating the business or routing logic
    /// For instance: switching to using IDO requests instead of a database view
    /// </summary>
    public interface IMESMaterialsAccess
    {
        /// <summary>
        /// This method retreives a lists of materials (CurrentMaterials)
        /// for a job given the item and serial-tracked serial number for the job
        /// </summary>
        /// <param name="itemno">Part number for the job</param>
        /// <param name="serialno">Serial-tracked serial number for the job</param>
        /// <returns>A list of CurrentMaterials information</returns>
        public List<MESMaterial> GetMaterialsForItem(string itemno, string serialno);
    }
}
