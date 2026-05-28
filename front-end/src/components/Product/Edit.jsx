import { useEffect, useState } from "react";
import Form from "./Form";

import {
  getById,
  update
} from "../../api/fetch-wrapper.js";

import {
  useNavigate,
  useParams
} from "react-router-dom";

export default function Edit() {

  const { id } = useParams();

  const navigate = useNavigate();

  const [product, setProduct] = useState(null);

  useEffect(() => {

    async function loadProduct() {

      try {

        const data = await getById(
          "products",
          id
        );

        setProduct({

          productName: data.productName,
          categoryID: data.categoryID,
          subCategoryID: data.subCategoryID,
          unitPrice: data.unitPrice,
          inventory: data.inventory,
          productKey: data.productKey

        });

      } catch (err) {

        console.error(err);

      }
    }

    loadProduct();

  }, [id]);

  async function handleSubmit(productData) {

    try {

      await update(
        "products",
        id,
        productData
      );

      alert("Product updated successfully!");

      navigate("/");

    } catch (err) {

      console.error(err);

      alert("Update failed");

    }
  }

  if (!product) {
    return <p>Loading...</p>;
  }

  return (
    <div>

      <h2>Edit Product</h2>

      <Form
        initialValues={product}
        onSubmit={handleSubmit}
        buttonText="Update"
      />

    </div>
  );
}