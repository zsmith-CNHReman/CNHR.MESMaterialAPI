using System.ComponentModel.DataAnnotations.Schema;

namespace CNHReman.SyteLine.MESMaterialsAPI.Models
{
    /// <summary>
    /// This class models information from the CNH_InternalAPIAuth table
    /// The Hash can be compared to an encrypted string of the key + "brown" for the row
    /// to see if the API key matches the encrypted hash in the database.
    /// </summary>
    public class APIKeyHash
    {
        [Column("hash")]
        public string Hash { get; set; }

        /// <summary>
        /// This is a "salt" for the hash
        /// I was just hungry when writing this and thinking about breakfast
        /// </summary>
        [Column("brown")]
        public string Brown { get; set; }


        [Column("RowPointer")]
        public Guid? RowPointer { get; set; }

    }
}
