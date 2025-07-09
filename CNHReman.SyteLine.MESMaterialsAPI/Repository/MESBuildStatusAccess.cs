using CNHReman.SyteLine.MESMaterialsAPI.IRepository;
using CNHReman.SyteLine.MESMaterialsAPI.Models;
using Microsoft.EntityFrameworkCore;
using System.Net;

namespace CNHReman.SyteLine.MESMaterialsAPI.Repository
{
    /// <summary>
    /// This class is the implementation of the behavior described by IMESBuildStatusAccess
    /// It accesses the SyteLine database to manipulate the UET for the completion of the build
    /// </summary>
    public class MESBuildStatusAccess : IMESBuildStatusAccess
    {
        private SytelineContext _context;

        public MESBuildStatusAccess(SytelineContext context)
        {
            _context = context;
        }

        /// <summary>
        /// This method accesses our database and sets the MESCompletionDate for the job
        /// with the given item number and serial number
        /// </summary>
        /// <param name="itemno">Part number</param>
        /// <param name="serialno">Serial number</param>
        /// <param name="reverse">1 = reverse completion</param>
        /// <returns>Returns an enum "CompletionResult" that communicates the success of the update</returns>
        public CompletionResult CompleteMesBuild(string itemno, string serialno, int reverse = 0)
        {
            try
            {
                // run the update
                // this looks like regular string interpolation but FromSQL wraps them in a parameter against SQL injection, fear not
                // https://learn.microsoft.com/en-us/ef/core/querying/sql-queries
                // the SP returns all materials updated
                List<MESMaterial> matls = _context.Materials.FromSql($"EXECUTE dbo.CNH_MESMarkComplete {itemno}, {serialno}, {reverse}").ToList();

                // if any of the materials have a complete date marked greater than yesterday (it should be marked for the current date), it succeeded
                // OR if we reversed the transaction, and all complete dates are null, it succeeded
                if (matls.Any(m => m.MESCompleteDate > DateTime.Today.AddDays(-1)) || 
                    reverse == 1 && matls.All(m => m.MESCompleteDate == null)){
                    return CompletionResult.Success;
                }
            }
            catch (Exception e)
            {
                return CompletionResult.Error;

            }
            return CompletionResult.Failure;
        }
    }
}
