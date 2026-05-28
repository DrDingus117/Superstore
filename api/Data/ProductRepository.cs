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

            using SqlConnection conn =
                new SqlConnection(_connectionString);

            using SqlCommand cmd =
                new SqlCommand("GetProducts", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Product product = new Product
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

                products.Add(product);
            }

            return products;
        }

        // GET PRODUCT BY ID
        public Product? GetProductById(int id)
        {
            Product? product = null;

            using SqlConnection conn =
                new SqlConnection(_connectionString);

            using SqlCommand cmd =
                new SqlCommand("GetProductById", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", id);

            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();

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

        // ADD PRODUCT
        public void AddProduct(Product product)
        {
            using SqlConnection conn =
                new SqlConnection(_connectionString);

            using SqlCommand cmd =
                new SqlCommand("CreateProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
            cmd.Parameters.AddWithValue("@CategoryID", product.CategoryID);
            cmd.Parameters.AddWithValue("@SubCategoryID", product.SubCategoryID);
            cmd.Parameters.AddWithValue("@UnitPrice", product.UnitPrice);
            cmd.Parameters.AddWithValue("@ProductKey", product.ProductKey);
            cmd.Parameters.AddWithValue("@Inventory", product.Inventory);

            conn.Open();

            cmd.ExecuteNonQuery();
        }

        // UPDATE PRODUCT
        public bool UpdateProduct(Product product)
        {
            using SqlConnection conn =
                new SqlConnection(_connectionString);

            using SqlCommand cmd =
                new SqlCommand("UpdateProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", product.ProductID);
            cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
            cmd.Parameters.AddWithValue("@CategoryID", product.CategoryID);
            cmd.Parameters.AddWithValue("@SubCategoryID", product.SubCategoryID);
            cmd.Parameters.AddWithValue("@UnitPrice", product.UnitPrice);
            cmd.Parameters.AddWithValue("@ProductKey", product.ProductKey);
            cmd.Parameters.AddWithValue("@Inventory", product.Inventory);

            conn.Open();

            int rowsAffected = cmd.ExecuteNonQuery();

            return rowsAffected > 0;
        }

        // DELETE PRODUCT
        public bool DeleteProduct(int id)
        {
            using SqlConnection conn =
                new SqlConnection(_connectionString);

            using SqlCommand cmd =
                new SqlCommand("DeleteProduct", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ProductID", id);

            conn.Open();

            int rowsAffected = cmd.ExecuteNonQuery();

            return rowsAffected > 0;
        }
    }
}