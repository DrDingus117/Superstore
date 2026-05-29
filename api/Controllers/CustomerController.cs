using Microsoft.AspNetCore.Mvc;

namespace api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CustomerController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetCustomers()
        {
            var customers = new List<object>
            {
                new { Id = 1, FirstName = "John", LastName = "Doe" },
                new { Id = 2, FirstName = "Jane", LastName = "Smith" },
                new { Id = 3, FirstName = "Michael", LastName = "Johnson" }
            };

            return Ok(customers);
        }
    }
}