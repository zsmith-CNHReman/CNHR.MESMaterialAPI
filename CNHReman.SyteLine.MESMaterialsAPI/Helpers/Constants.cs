using System.Net.NetworkInformation;
using System.Runtime.ConstrainedExecution;

namespace CNHReman.SyteLine.MESMaterialsAPI.Helpers
{
    /// <summary>
    /// This class contains static constants for use throughout the application
    /// </summary>
    public class Constants
    {
        public static string API_KEY_HEADER = "X-API-KEY";

        public static int SL_VERSION = 10; // set to "10" post-upgrade

        public static string APPLICATION_DESCRIPTION = "UjigamiAPI"; // This describes the application for our API Auth system

        public static bool SWAGGER_ENABLED = true;
    }
}
