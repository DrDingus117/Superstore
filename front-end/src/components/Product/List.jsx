import { useEffect, useState } from "react";

import {
  get,
  remove
} from "../../api/fetch-wrapper.js";

import {
  Link
} from "react-router-dom";

export default function List() {

  const [products, setProducts] = useState([]);

  async function loadProducts() {

    try {

      const data = await get("products");

      console.log("API RESPONSE:", data);

      const list = Array.isArray(data)
        ? data
        : Array.isArray(data?.$values)
        ? data.$values
        : [];

      setProducts(list);

    } catch (err) {

      console.error("Load failed:", err);

      setProducts([]);

    }
  }

  useEffect(() => {
    loadProducts();
  }, []);

  async function handleDelete(id) {

    const confirmed = window.confirm(
      "Delete this product?"
    );

    if (!confirmed) return;

    try {

      await remove("products", id);

      loadProducts();

    } catch (err) {

      console.error("Delete failed:", err);

      alert("Delete failed");

    }
  }

  return (
    <div>

      <h2>Products</h2>

      <Link to="/add">Add Product</Link>

      <br /><br />

      <table border="1" cellPadding="10">

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

                <td>${Number(p.unitPrice).toFixed(2)}</td>

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

                  <button onClick={() => handleDelete(p.productID)}>
                    Delete
                  </button>

                </td>

              </tr>

            ))

          ) : (

            <tr>
              <td colSpan="5">No products found</td>
            </tr>

          )}

        </tbody>

      </table>

    </div>
  );
}