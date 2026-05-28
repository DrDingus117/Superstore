import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getProduct } from "../api";

export default function ProductDetails() {
  const { id } = useParams();
  const [product, setProduct] = useState(null);
  const [error, setError] = useState("");

  useEffect(() => {
    async function load() {
      try {
        const data = await getProduct(id);
        console.log("PRODUCT DETAIL:", data);
        setProduct(data);
      } catch (err) {
        console.error(err);
        setError("Failed to load product");
      }
    }

    load();
  }, [id]);

  if (error) return <p>{error}</p>;
  if (!product) return <p>Loading...</p>;

  return (
    <div>
      <h2>Product Details</h2>

      <p><b>ID:</b> {product.productID}</p>
      <p><b>Name:</b> {product.productName}</p>
      <p><b>Category:</b> {product.category}</p>
      <p><b>Price:</b> ${product.unitPrice}</p>
      <p><b>Inventory:</b> {product.inventory}</p>
    </div>
  );
}