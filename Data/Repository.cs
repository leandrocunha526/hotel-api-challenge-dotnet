using hotel_api_challenge.Models;
using Microsoft.EntityFrameworkCore;

namespace hotel_api_challenge.Data
{
    public class Repository : IRepository
    {
        private readonly DataContext _context;

        public Repository(DataContext context)
        {
            _context = context;
        }

        public void Add<T>(T entity) where T : class
        {
            _context.Add(entity);
        }

        public void Update<T>(T entity) where T : class
        {
            _context.Update(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            _context.Remove(entity);
        }

        public async Task<bool> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<Person[]> GetAllPersonsAsync()
        {
            return await _context.Persons
                .OrderBy(p => p.Id)
                .Include(r => r.Reservations)
                .ThenInclude(s => s.Suite)
                .ToArrayAsync();
        }

        public async Task<Person?> GetPersonByIdAsync(int id)
        {
            return await _context.Persons
                .Include(p => p.Reservations)
                .ThenInclude(r => r.Suite)
                .FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<Suite[]> GetAllSuitesAsync()
        {
            return await _context.Suites
                .OrderBy(s => s.Type)
                .Include(r => r.Reservations)
                .ToArrayAsync();
        }

        public async Task<Suite?> GetSuiteByIdAsync(int id)
        {
            return await _context.Suites
                .Include(r => r.Reservations)
                .FirstOrDefaultAsync(s => s.Id == id);
        }

        public async Task<Reservation[]> GetAllReservationsAsync()
        {
            return await _context.Reservations
                .Include(r => r.Person)
                .Include(r => r.Suite)
                .OrderByDescending(r => r.CheckInDate)
                .ToArrayAsync();
        }

        public async Task<Reservation?> GetReservationByIdAsync(int id)
        {
            return await _context.Reservations
                .Include(r => r.Person)
                .Include(r => r.Suite)
                .FirstOrDefaultAsync(r => r.Id == id);
        }

        // MÉTODOS PARA SUITES COM RESERVAS VIGENTES
        public async Task<object[]> GetAllSuitesWithCurrentReservationsAsync()
        {
            var today = DateTime.Today;

            return await _context.Suites
                .OrderBy(s => s.Type)
                .Select(s => new
                {
                    s.Id,
                    s.Type,
                    s.Capacidade,
                    s.PriceByDay,
                    s.CreatedAt,
                    s.UpdatedAt,
                    Reservations = s.Reservations
                        .Where(r => r.CheckInDate <= today && r.CheckOutDate >= today)
                        .Select(r => new
                        {
                            r.Id,
                            r.CheckInDate,
                            r.CheckOutDate,
                            Person = new
                            {
                                r.Person!.Id,
                                r.Person.FullName
                            }
                        }).ToList()
                })
                .ToArrayAsync();
        }


        public async Task<object?> GetSuiteWithCurrentReservationsByIdAsync(int id)
        {
            var today = DateTime.Today;

            return await _context.Suites
                .Where(s => s.Id == id)
                .Select(s => new
                {
                    s.Id,
                    s.Type,
                    s.Capacidade,
                    s.PriceByDay,
                    s.CreatedAt,
                    s.UpdatedAt,
                    Reservations = s.Reservations
                        .Where(r => r.CheckInDate <= today && r.CheckOutDate >= today)
                        .Select(r => new
                        {
                            r.Id,
                            r.CheckInDate,
                            r.CheckOutDate,
                            Person = new
                            {
                                r.Person!.Id,
                                r.Person.FullName
                            }
                        })
                })
                .FirstOrDefaultAsync();
        }
    }
}
