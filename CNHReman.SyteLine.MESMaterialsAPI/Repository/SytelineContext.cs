using CNHReman.SyteLine.MESMaterialsAPI.Helpers;
using CNHReman.SyteLine.MESMaterialsAPI.Models;
using Microsoft.EntityFrameworkCore;


namespace CNHReman.SyteLine.MESMaterialsAPI.Repository
{
    /// <summary>
    /// This is a "context" class for our database
    /// Essentially, it maps our relational database to C# objects
    /// It mostly contains configuration to that end.
    /// </summary>
    public class SytelineContext : DbContext
    {
        private readonly IConfiguration _config;

        public SytelineContext(IConfiguration config)
        {
            _config = config;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string connectionString = Constants.SL_VERSION == 9 ? _config.GetConnectionString("SyteLine") : _config.GetConnectionString("SyteLine10");
            optionsBuilder.UseSqlServer(connectionString);
            base.OnConfiguring(optionsBuilder);
        }

        public DbSet<MESMaterial> Materials { get; set; }

        public DbSet<APIKeyMap> APIKeyMaps { get; set; }
        
        public DbSet<APIKeyHash> APIKeyHashes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Map the entity to the view
            modelBuilder.Entity<MESMaterial>(entity =>
            {
                entity.HasNoKey(); // A view does not have a primary key
                entity.ToView("CNH_UjigamiMaterialsVw"); // Map to the name of the view in the database
            });

            modelBuilder.Entity<APIKeyMap>(entity =>
            {
                entity.HasNoKey();
                entity.ToTable("CNH_APIAuthMap");
            });

            modelBuilder.Entity<APIKeyHash>(entity =>
            {
                entity.HasKey("RowPointer");
                entity.ToTable("CNH_InternalAPIAuth");
            });
        }
    }
}
