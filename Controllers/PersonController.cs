using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using hotel_api_challenge.Data;
using hotel_api_challenge.Models;

namespace hotel_api_challenge.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : ControllerBase
    {
        private readonly IRepository _repository;

        public PersonController(IRepository repository)
        {
            _repository = repository;
        }

        // GET: api/Person
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Person>>> GetPersons()
        {
            var persons = await _repository.GetAllPersonsAsync();
            return Ok(persons);
        }

        // GET: api/Person/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Person>> GetPerson(int id)
        {
            var person = await _repository.GetPersonByIdAsync(id);

            if (person == null)
            {
                return NotFound();
            }

            return Ok(person);
        }

        // PUT: api/Person/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPerson(int id, Person person)
        {
            if (id != person.Id)
            {
                return BadRequest();
            }

            var existingPerson = await _repository.GetPersonByIdAsync(id);
            if (existingPerson == null)
            {
                return NotFound();
            }

            // atualiza os campos
            existingPerson.FullName = person.FullName;
            existingPerson.Email = person.Email;
            existingPerson.Phone = person.Phone;
            existingPerson.BirthDate = person.BirthDate;

            try
            {
                await _repository.SaveChangesAsync();
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("IX_Person_Email") == true && ex.InnerException?.Message.Contains("IX_Person_Phone") == true)
                {
                    return BadRequest("Este email ou telefone já está cadastrado");
                }
                throw;
            }

            return NoContent();
        }

        // POST: api/Person
        [HttpPost]
        public async Task<ActionResult<Person>> PostPerson(Person person)
        {
            try
            {
                _repository.Add(person);
                await _repository.SaveChangesAsync();
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("IX_Person_Email") == true && ex.InnerException?.Message.Contains("IX_Person_Phone") == true)
                {
                    return BadRequest("Este email ou telefone já está cadastrado");
                }
                throw;
            }

            return CreatedAtAction(nameof(GetPerson), new { id = person.Id }, person);
        }

        // DELETE: api/Person/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePerson(int id)
        {
            var person = await _repository.GetPersonByIdAsync(id);
            if (person == null)
            {
                return NotFound();
            }

            _repository.Delete(person);
            await _repository.SaveChangesAsync();

            return NoContent();
        }
    }
}
