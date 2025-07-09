using System.ComponentModel.DataAnnotations.Schema;

namespace CNHReman.SyteLine.MESMaterialsAPI.Models
{
    /// <summary>
    /// This model represents table information from the CNH_APIAuthMap 
    /// This is used to map API Keys to the applications they authorize to
    /// </summary>
    public class APIKeyMap
    {
        /// <summary>
        /// RowPointer of the API Key in CNH_InternalAPIAuths
        /// </summary>
        [Column("KeyPointer")]
        public Guid? KeyPointer { get; set; }

        /// <summary>
        /// A readable description of the authorized application
        /// </summary>
        [Column("ApplicationDesc")]
        public string? ApplicationDesc { get; set; }
    }
}
