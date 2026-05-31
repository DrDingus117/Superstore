using api.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace api.Data
{
    public class ProductRepository
    {
        private readonly string _connectionString;

        public ProductRepository(IConfiguration configuration)
        {
            _connectionString =
                configuration.GetConnectionString("Superstore")!;
        }

        // GET ALL PRODUCTS
        public List<Product> GetProducts()
        {
            List<Product> products = new();

            using SqlConnection conn = new(_connectionString);
            using SqlCommand cmd = new("GetProducts", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            using SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                products.Add(new Product
                {
                    ProductID = Convert.ToInt32(reader["ProductID"]),
                    ProductName = reader["ProductName"].ToString()!,
                    CategoryID = Convert.ToInt32(reader["CategoryID"]),
                    SubCategoryID = Convert.ToInt32(reader["SubCategoryID"]),
                    Category = reader["Category"].ToString(),
                    SubCategory = reader["SubCategory"].ToString(),
                    UnitPrice = Convert.ToDecimal(reader["UnitPrice"]),
                    ProductKey = reader["ProductKey"].ToString()!,
                    Inventory = Convert.ToInt32(reader["Inventory"])
                });
            }

            return products;
        }

        // GET BY ID
        public Product? GetProductById(int id)
        {
            Product? product = null;

            using SqlConnection conn = new(_connectionString);
            using SqlCommand cmd = new("GetProductById", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", id);

            conn.Open();

            using SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                product = new Product
                {
                    ProductID = Convert.ToInt32(reader["ProductID"]),
                    ProductName = reader["ProductName"].ToString()!,
                    CategoryID = Convert.ToInt32(reader["CategoryID"]),
                    SubCategoryID = Convert.ToInt32(reader["SubCategoryID"]),
                    Category = reader["Category"].ToString(),
                    SubCategory = reader["SubCategory"].ToString(),
                    UnitPrice = Convert.ToDecimal(reader["UnitPrice"]),
                    ProductKey = reader["ProductKey"].ToString()!,
                    Inventory = Convert.ToInt32(reader["Inventory"])
                };
            }

            return product;
        }

        // ADD PRODUCT (FIXED - RETURNS NEW ID)
        public int AddProduct(Product product)
        {
            using SqlConnection conn = new(_connectionString);
            using SqlCommand cmd = new("CreateProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
            cmd.Parameters.AddWithValue("@CategoryID", product.CategoryID);
            cmd.Parameters.AddWithValue("@SubCategoryID", product.SubCategoryID);
            cmd.Parameters.AddWithValue("@UnitPrice", product.UnitPrice);
            cmd.Parameters.AddWithValue("@ProductKey", product.ProductKey);
            cmd.Parameters.AddWithValue("@Inventory", product.Inventory);

            conn.Open();

            // Stored procedure returns SCOPE_IDENTITY()
            object result = cmd.ExecuteScalar();

            return Convert.ToInt32(result);
        }

        // UPDATE PRODUCT
        public bool UpdateProduct(Product product)
        {
            using SqlConnection conn = new(_connectionString);
            using SqlCommand cmd = new("UpdateProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", product.ProductID);
            cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
            cmd.Parameters.AddWithValue("@CategoryID", product.CategoryID);
            cmd.Parameters.AddWithValue("@SubCategoryID", product.SubCategoryID);
            cmd.Parameters.AddWithValue("@UnitPrice", product.UnitPrice);
            cmd.Parameters.AddWithValue("@ProductKey", product.ProductKey);
            cmd.Parameters.AddWithValue("@Inventory", product.Inventory);

            conn.Open();

            return cmd.ExecuteNonQuery() > 0;
        }

        // DELETE PRODUCT
        public bool DeleteProduct(int id)
        {
            using SqlConnection conn = new(_connectionString);
            using SqlCommand cmd = new("DeleteProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", id);

            conn.Open();

            return cmd.ExecuteNonQuery() > 0;
        }
    }
}