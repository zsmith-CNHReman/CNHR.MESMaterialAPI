namespace CNHReman.SyteLine.MESMaterialsAPI.Models
{
    /// <summary>
    /// This is just supposed to hold a hash and a salt from the database
    /// The naming motivated by snackiness
    /// </summary>
    public class HashbrownModel
    {
        /// <summary>
        /// An encrypted (hashed) string
        /// </summary>
        public string? hash;

        /// <summary>
        /// A value appended to the unencrypted string before encryption
        /// for increased security against rainbow table attacks
        /// </summary>
        public string? brown;
    }
}
