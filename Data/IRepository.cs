using hotel_api_challenge.Models;

namespace hotel_api_challenge.Data
{
    public interface IRepository
    {
        void Add<T>(T entity) where T : class;
        void Update<T>(T entity) where T : class;
        void Delete<T>(T entity) where T : class;

        Task<bool> SaveChangesAsync();

        // Person
        Task<Person[]> GetAllPersonsAsync();
        Task<Person?> GetPersonByIdAsync(int id);

        // Suite
        Task<Suite[]> GetAllSuitesAsync();
        Task<Suite?> GetSuiteByIdAsync(int id);

        // Novos métodos para Suite com reservas vigentes
        Task<object[]> GetAllSuitesWithCurrentReservationsAsync();
        Task<object?> GetSuiteWithCurrentReservationsByIdAsync(int id);

        // Reservation
        Task<Reservation[]> GetAllReservationsAsync();
        Task<Reservation?> GetReservationByIdAsync(int id);
    }
}
