using CNHReman.SyteLine.MESMaterialsAPI.Helpers;
using CNHReman.SyteLine.MESMaterialsAPI.IRepository;
using CNHReman.SyteLine.MESMaterialsAPI.Models;
using System.Security.Cryptography;
using System.Text;

namespace CNHReman.SyteLine.MESMaterialsAPI.Repository
{
    /// <summary>
    /// This is an implementation for the Internal API Access for verifying API keys
    /// </summary>
    public class InternalAPIAccess : IInternalAPIAccess
    {
        public SytelineContext _context; // the model of our db and things we can do with it

        public InternalAPIAccess(SytelineContext context)
        {
            _context = context;
        }

        /// <summary>
        /// This method encrypts the key with the "browns"/salt of all CNH_InternalAPIAuth rows relevant to this application
        /// To determine if there are any matches/if the key is valid for the application
        /// </summary>
        /// <param name="key">Unencrypted API key</param>
        /// <returns>Wether or not the key was valid</returns>
        public bool IsKeyValid(string key)
        {
            // Get all the row pointers relevant to this application
            IQueryable<Guid?> KeyIDsQueryable = from KeyAppMap in _context.APIKeyMaps
                         where KeyAppMap.ApplicationDesc == Constants.APPLICATION_DESCRIPTION
                         select KeyAppMap.KeyPointer;
            
            // use the row pointer to retrieve the hash and the salt
            IQueryable<HashbrownModel> hashbrowns = from Hashes in _context.APIKeyHashes
                                    where KeyIDsQueryable.Contains(Hashes.RowPointer)
                                    select new HashbrownModel
                                    {
                                        hash = Hashes.Hash,
                                        brown = Hashes.Brown
                                    };

            // check if the hash matches key+salt encrypted
            foreach (var hashbrown in hashbrowns) {
                if (hashbrown.hash == SHA256Encrypt(key + hashbrown.brown))
                {
                    return true;
                }
            }
                
            return false;
        }

        /// <summary>
        /// SHA256 is a highly secure encryption algorithm.
        /// This method encrypts a string using that algorithm.
        /// </summary>
        /// <param name="rawData">Unencrypted string</param>
        /// <returns>Encrypted string</returns>
        private string SHA256Encrypt(string rawData)
        {
            // using SHA256 hashing
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Compute the hash as byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a hexadecimal string
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2")); // each byte represented as a 2 char hex value
                }
                return builder.ToString();
            }
        }
    }
}
