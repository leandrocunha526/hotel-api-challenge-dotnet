using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using hotel_api_challenge.Data;
using hotel_api_challenge.Models;

namespace hotel_api_challenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReservationController : ControllerBase
    {
        private readonly DataContext _context;

        public ReservationController(DataContext context)
        {
            _context = context;
        }

        // GET: api/Reservation
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Reservation>>> GetReservations()
        {
            return await _context.Reservations
                .Include(r => r.Person)
                .Include(r => r.Suite)
                .ToListAsync();
        }

        // GET: api/Reservation/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Reservation>> GetReservation(int id)
        {
            var reservation = await _context.Reservations
                .Include(r => r.Person)
                .Include(r => r.Suite)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (reservation == null)
                return NotFound();

            return reservation;
        }

        // PUT: api/Reservation/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutReservation(int id, Reservation reservation)
        {
            if (id != reservation.Id)
                return BadRequest("ID da URL diferente do ID do objeto.");

            var existingReservation = await _context.Reservations
                .Include(r => r.Suite)
                .FirstOrDefaultAsync(r => r.Id == id);

            if (existingReservation == null)
                return NotFound();

            if (!IsRoomAvailable(reservation.SuiteId, reservation.CheckInDate, reservation.CheckOutDate, reservation.Id))
                return BadRequest("Suíte indisponível nas datas selecionadas.");

            // Atualiza campos permitidos
            existingReservation.PersonId = reservation.PersonId;
            existingReservation.SuiteId = reservation.SuiteId;
            existingReservation.CheckInDate = reservation.CheckInDate;
            existingReservation.CheckOutDate = reservation.CheckOutDate;
            existingReservation.DiscountPercentage = reservation.DiscountPercentage;

            // Calcula novamente o preço total
            existingReservation.TotalPrice = CalculateTotalPrice(existingReservation);

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // POST: api/Reservation
        [HttpPost]
        public async Task<ActionResult<Reservation>> PostReservation(Reservation reservation)
        {
            if (!IsRoomAvailable(reservation.SuiteId, reservation.CheckInDate, reservation.CheckOutDate))
                return BadRequest("Suíte indisponível nas datas selecionadas.");

            reservation.TotalPrice = CalculateTotalPrice(reservation);

            _context.Reservations.Add(reservation);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetReservation), new { id = reservation.Id }, reservation);
        }

        // DELETE: api/Reservation/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReservation(int id)
        {
            var reservation = await _context.Reservations.FindAsync(id);

            if (reservation == null)
                return NotFound();

            _context.Reservations.Remove(reservation);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool IsRoomAvailable(int suiteId, DateTime checkIn, DateTime checkOut, int? ignoreReservationId = null)
        {
            return !_context.Reservations.Any(r =>
                r.SuiteId == suiteId &&
                r.Id != ignoreReservationId &&
                r.CheckInDate < checkOut &&
                r.CheckOutDate > checkIn);
        }

        private decimal CalculateTotalPrice(Reservation reservation)
        {
            var days = (reservation.CheckOutDate - reservation.CheckInDate).Days;

            if (days < 1)
            {
                var suite = _context.Suites.Find(reservation.SuiteId);
                if (suite == null) return 0;
                return CalculateTotalPrice(days, suite.PriceByDay, reservation.DiscountPercentage);
            }
            else
            {
                if (reservation.Suite == null)
                {
                    reservation.Suite = _context.Suites.Find(reservation.SuiteId)!;
                }
                if (reservation.Suite == null) return 0;

                return CalculateTotalPrice(days, reservation.Suite.PriceByDay, reservation.DiscountPercentage);
            }
        }

        private decimal CalculateTotalPrice(int days, decimal priceByDay, decimal discount)
        {
            var total = days * priceByDay;
            if (days >= 10)
            {
                var discountFactor = (100 - discount) / 100;
                total *= discountFactor;
            }
            return total;
        }

        private bool ReservationExists(int id)
        {
            return _context.Reservations.Any(e => e.Id == id);
        }
    }
}
