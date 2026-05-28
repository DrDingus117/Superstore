import Form from "./Form";

import {
  create
} from "../../api/fetch-wrapper.js";

import {
  useNavigate
} from "react-router-dom";

export default function Add() {

  const navigate = useNavigate();

  async function handleSubmit(productData) {

    try {

      await create(
        "products",
        productData
      );

      alert("Product created successfully!");

      navigate("/");

    } catch (err) {

      console.error(err);

      alert("Create failed");

    }
  }

  return (
    <div>

      <h2>Add Product</h2>

      <Form
        onSubmit={handleSubmit}
        buttonText="Create"
      />

    </div>
  );
}