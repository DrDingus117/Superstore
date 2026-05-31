import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

import { getById } from "../../api/fetch-wrapper.js";

export default function Detail() {

  const { id } = useParams();

  const [product, setProduct] = useState(null);

  useEffect(() => {

    async function load() {

      try {

        const data = await getById(
          "products",
          id
        );

        setProduct(data);

      } catch (err) {

        console.error(err);

      }
    }

    load();

  }, [id]);

  if (!product) {
    return <p>Loading...</p>;
  }

  return (
    <div>

      <h2>Product Details</h2>

      <p>
        <b>ID:</b>{" "}
        {product.productID}
      </p>

      <p>
        <b>Name:</b>{" "}
        {product.productName}
      </p>

      <p>
        <b>Category:</b>{" "}
        {product.category}
      </p>

      <p>
        <b>Price:</b>{" "}
        ${Number(product.unitPrice).toFixed(2)}
      </p>

      <p>
        <b>Inventory:</b>{" "}
        {product.inventory}
      </p>

    </div>
  );
}