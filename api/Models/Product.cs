using System.ComponentModel.DataAnnotations;

namespace api.Models
{
    public class Product
    {
        public int ProductID { get; set; }

        [Required(ErrorMessage = "Product name is required")]
        [StringLength(100)]
        public string ProductName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Category ID is required")]
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "SubCategory ID is required")]
        public int SubCategoryID { get; set; }

        [Range(0.01, 100000,
            ErrorMessage = "Unit price must be greater than 0")]
        public decimal UnitPrice { get; set; }

        [Required(ErrorMessage = "Product key is required")]
        public string ProductKey { get; set; } = string.Empty;

        [Range(0, 10000,
            ErrorMessage = "Inventory cannot be negative")]
        public int Inventory { get; set; }

        public string? Category { get; set; }

        public string? SubCategory { get; set; }
    }
}