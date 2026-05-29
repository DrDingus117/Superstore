using api.Data;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly ProductRepository _repository;

        public ProductsController(ProductRepository repository)
        {
            _repository = repository;
        }

        // GET: api/products
        [HttpGet]
        public IActionResult GetProducts()
        {
            return Ok(_repository.GetProducts());
        }

        // GET: api/products/5
        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            Product? product = _repository.GetProductById(id);

            if (product == null)
            {
                return NotFound(new
                {
                    message = "Product not found"
                });
            }

            return Ok(product);
        }

        // POST: api/products
        [HttpPost]
        public IActionResult AddProduct(Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                _repository.AddProduct(product);

                return CreatedAtAction(
                    nameof(GetProductById),
                    new { id = product.ProductID },
                    product
                );
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    message = ex.Message
                });
            }
        }

        // PUT: api/products/5
        [HttpPut("{id}")]
        public IActionResult UpdateProduct(int id, Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            Product? existingProduct =
                _repository.GetProductById(id);

            if (existingProduct == null)
            {
                return NotFound(new
                {
                    message = "Product not found"
                });
            }

            product.ProductID = id;

            try
            {
                _repository.UpdateProduct(product);

                return Ok(new
                {
                    message = "Product updated successfully"
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    message = ex.Message
                });
            }
        }

        // DELETE: api/products/5
        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            Product? existingProduct =
                _repository.GetProductById(id);

            if (existingProduct == null)
            {
                return NotFound(new
                {
                    message = "Product not found"
                });
            }

            try
            {
                _repository.DeleteProduct(id);

                return Ok(new
                {
                    message = "Product deleted successfully"
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new
                {
                    message = ex.Message
                });
            }
        }
    }
}
