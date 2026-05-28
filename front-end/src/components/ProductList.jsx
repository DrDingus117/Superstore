import { useEffect, useState } from "react";
import { getProducts, deleteProduct } from "../api";
import { Link } from "react-router-dom";

export default function ProductList() {

  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  // LOAD PRODUCTS
  async function loadProducts() {

    try {

      setLoading(true);

      const data = await getProducts();

      console.log("API RESPONSE:", data);

      // Handles different backend response shapes safely
      const list = Array.isArray(data)
        ? data
        : Array.isArray(data?.$values)
        ? data.$values
        : Array.isArray(data?.data)
        ? data.data
        : Array.isArray(data?.products)
        ? data.products
        : [];

      setProducts(list);

    } catch (err) {

      console.error("Failed to load products:", err);
      setProducts([]);

    } finally {

      setLoading(false);

    }
  }

  // LOAD ON PAGE START
  useEffect(() => {
    loadProducts();
  }, []);

  // DELETE PRODUCT
  async function handleDelete(id) {

    // Confirm before deleting
    const confirmed = window.confirm(
      "Are you sure you want to delete this product?"
    );

    if (!confirmed) return;

    try {

      await deleteProduct(id);

      // Refresh products list
      loadProducts();

    } catch (err) {

      console.error("Delete failed:", err);
      alert("Delete failed");

    }
  }

  // LOADING STATE
  if (loading) {
    return <p>Loading products...</p>;
  }

  return (
    <div>

      <h2>Products</h2>

      <h4>Total: {products.length}</h4>

      <Link to="/add">Add Product</Link>

      <br />
      <br />

      <table
        border="1"
        cellPadding="10"
        style={{ marginTop: "10px" }}
      >

        <thead>

          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Inventory</th>
            <th>Actions</th>
          </tr>

        </thead>

        <tbody>

          {products.length > 0 ? (

            products.map((p) => (

              <tr key={p.productID}>

                <td>{p.productID}</td>

                <td>{p.productName}</td>

                <td>${p.unitPrice}</td>

                <td>{p.inventory}</td>

                <td>

                  <Link to={`/products/${p.productID}`}>
                    View
                  </Link>

                  {" | "}

                  <Link to={`/edit/${p.productID}`}>
                    Edit
                  </Link>

                  {" | "}

                  <button
                    onClick={() => handleDelete(p.productID)}
                  >
                    Delete
                  </button>

                </td>

              </tr>

            ))

          ) : (

            <tr>

              <td colSpan="5">
                No products found
              </td>

            </tr>

          )}

        </tbody>

      </table>

    </div>
  );
}