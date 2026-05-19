using System.Data;
using api.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IDatabaseService _db;

    public ProductsController(IDatabaseService db)
    {
        _db = db;
    }
    
    [HttpGet(Name = "GetAllProducts")]
    public async Task<IActionResult> Get()
    {
        try
        {
            List<Dictionary<string, object?>> rows = await _db.QueryAsync("GetProducts");

            List<Product> products = rows.Select(MapToProduct).ToList();
            return Ok(products);
        }
        catch (Exception ex)
        {
            // Log the exception (not shown here)
            return StatusCode(500, $"An error occurred while processing your request for all products: {ex.Message}");
        }
    }

    [HttpGet("{id}", Name = "GetProductById")]
    public async Task<IActionResult> Get(int id)
    {
        try
        {
            var row = await _db.QuerySingleAsync("GetProduct", new SqlParameter("@ProductID", id));
            if (row == null)
                return NotFound();

            Product product = MapToProduct(row);
            return Ok(product);
        }
        catch (Exception ex)
        {
            // Log the exception (not shown here)
            return StatusCode(500, $"An error occurred while processing your request for the product: {ex.Message}");
        }
    }

   [HttpPost(Name = "CreateProduct")]
    public async Task<IActionResult> Create([FromBody] Product product)
    {
        try
        {
            var parameters = new[]
            {
                new SqlParameter("@ProductName", product.ProductName),
                new SqlParameter("@CategoryID", product.CategoryID),
                new SqlParameter("@SubCategoryID", product.SubCategoryID),
                new SqlParameter("@UnitPrice", product.UnitPrice),
                new SqlParameter("@Quantity", product.Quantity)
            };

            // Use ExecuteAsync (returns affected rows) since IDatabaseService does not expose ExecuteScalarAsync
            int rowsAffected = await _db.ExecuteAsync("CreateProduct", parameters);
            // Created resource id is not available from ExecuteAsync; return generic 201 Created
            return Created(string.Empty, null);
        }
        catch (Exception ex)
        {
            // Log the exception (not shown here)
            return StatusCode(500, $"An error occurred while processing your request to create a product: {ex.Message}");
        }
    }

    private static Product MapToProduct(Dictionary<string, object?> row) => new Product
    {
        ProductID = Convert.ToInt32(row["ProductID"]),
        ProductName = Convert.ToString(row["ProductName"]) ?? string.Empty,
        CategoryID = Convert.ToInt32(row["CategoryID"]),
        SubCategoryID = Convert.ToInt32(row["SubCategoryID"]),
        Category = Convert.ToString(row["Category"]) ?? string.Empty,
        SubCategory = Convert.ToString(row["SubCategory"]) ?? string.Empty,
        UnitPrice = Convert.ToDecimal(row["UnitPrice"]),
        Quantity = Convert.ToInt32(row["Quantity"])
    };
}