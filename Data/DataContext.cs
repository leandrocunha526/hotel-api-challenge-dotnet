using hotel_api_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace hotel_api_challenge.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Person> Persons { get; set; }
        public DbSet<Suite> Suites { get; set; }
        public DbSet<Reservation> Reservations { get; set; }

        public async override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
        {
            var entries = ChangeTracker
                .Entries()
                .Where(e => e.Entity is IAuditable &&
                        (e.State == EntityState.Added || e.State == EntityState.Modified));

            foreach (var entityEntry in entries)
            {
                var auditableEntity = (IAuditable)entityEntry.Entity;
                if (entityEntry.State == EntityState.Added)
                {
                    auditableEntity.CreatedAt = DateTime.Now;
                    auditableEntity.UpdatedAt = DateTime.Now;
                }
                else if (entityEntry.State == EntityState.Modified)
                {
                    auditableEntity.UpdatedAt = DateTime.Now;
                }
            }

            return await base.SaveChangesAsync(cancellationToken);
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Person>()
                .HasIndex(p => p.Email)
                .IsUnique();

            modelBuilder.Entity<Person>()
                .HasIndex(p => p.Phone)
                .IsUnique();

            if (Database.ProviderName!.Contains("SqlServer"))
            {
                modelBuilder.Entity<Suite>()
                    .Property(s => s.Type)
                    .HasColumnType("NVARCHAR(MAX)");
            }
            else if (Database.ProviderName.Contains("Sqlite"))
            {
                modelBuilder.Entity<Suite>()
                    .Property(s => s.Type)
                    .HasColumnType("TEXT");
            }
        }
    }
}
