using CNHReman.SyteLine.MESMaterialsAPI.IRepository;
using CNHReman.SyteLine.MESMaterialsAPI.Models;

namespace CNHReman.SyteLine.MESMaterialsAPI.Repository
{
    public class MESMaterialsAccess : IMESMaterialsAccess
    {
        private SytelineContext _context;

        public MESMaterialsAccess(SytelineContext context)
        {
            _context = context;
        }

        /// <summary>
        /// This simple DAL method takes the item number and serial number
        /// and filters the CNH_UjigamiMaterialsVw for the CurrentMaterial records for that job
        /// </summary>
        /// <param name="itemno">Part number</param>
        /// <param name="serialno">Serial number</param>
        /// <returns>A list of current material information</returns>
        public List<MESMaterial> GetMaterialsForItem(string itemno, string serialno)
        {
            List<MESMaterial> matls = new List<MESMaterial>();
            try
            {
                // LINQ - where JobItem = item AND JobSerial = serial
                matls = _context.Materials
                  .Where(m => m.JobItem == itemno && m.JobSerial == serialno)
                  .ToList();
            }
            catch (Exception ex)
            {
                // TODO: Better exception handling
                Console.WriteLine(ex.ToString());
            }
            return matls;
        }
    }
}
