using Microsoft.AspNetCore.Mvc;
using hotel_api_challenge.Data;
using hotel_api_challenge.Models;

namespace hotel_api_challenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuiteController : ControllerBase
    {
        private readonly IRepository _repository;

        public SuiteController(IRepository repository)
        {
            _repository = repository;
        }

        // GET: api/Suite
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Suite>>> GetSuites()
        {
            var suites = await _repository.GetAllSuitesWithCurrentReservationsAsync();
            return Ok(suites);
        }

        // GET: api/Suite/:id
        [HttpGet("{id}")]
        public async Task<ActionResult<Suite>> GetSuite(int id)
        {
            var suite = await _repository.GetSuiteWithCurrentReservationsByIdAsync(id);

            if (suite == null)
            {
                return NotFound();
            }

            return Ok(suite);
        }

        // PUT: api/Suite/:id
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSuite(int id, Suite suite)
        {
            if (id != suite.Id)
            {
                return BadRequest("O ID da URL é diferente do ID do corpo da requisição.");
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingSuite = await _repository.GetSuiteByIdAsync(id);
            if (existingSuite == null)
            {
                return NotFound();
            }

            existingSuite.Type = suite.Type;
            existingSuite.Capacidade = suite.Capacidade;
            existingSuite.PriceByDay = suite.PriceByDay;

            await _repository.SaveChangesAsync();

            return NoContent();
        }

        // POST: api/Suite
        [HttpPost]
        public async Task<ActionResult<Suite>> PostSuite(Suite suite)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _repository.Add(suite);
            await _repository.SaveChangesAsync();

            return CreatedAtAction(nameof(GetSuite), new { id = suite.Id }, suite);
        }

        // DELETE: api/Suite/:id
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSuite(int id)
        {
            var suite = await _repository.GetSuiteByIdAsync(id);
            if (suite == null)
            {
                return NotFound();
            }

            _repository.Delete(suite);
            await _repository.SaveChangesAsync();

            return NoContent();
        }
    }
}
