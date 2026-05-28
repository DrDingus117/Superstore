import { useEffect, useState } from "react";
import {
  createProduct,
  getProduct,
  updateProduct
} from "../api";

import {
  useNavigate,
  useParams
} from "react-router-dom";

export default function ProductForm() {

  const { id } = useParams();

  const isEdit = Boolean(id);

  const navigate = useNavigate();

  const [saving, setSaving] = useState(false);

  const [form, setForm] = useState({
    productName: "",
    categoryID: "",
    subCategoryID: "",
    unitPrice: "",
    inventory: "",
    productKey: ""
  });

  // LOAD PRODUCT FOR EDIT
  useEffect(() => {

    if (isEdit) {

      getProduct(id)

        .then((data) => {

          setForm({

            productName: data.productName || "",
            categoryID: data.categoryID || "",
            subCategoryID: data.subCategoryID || "",
            unitPrice: data.unitPrice || "",
            inventory: data.inventory || "",
            productKey: data.productKey || ""

          });

        })

        .catch((err) => {

          console.error("Load failed:", err);

        });

    }

  }, [id, isEdit]);

  // HANDLE INPUT CHANGES
  function handleChange(e) {

    setForm({
      ...form,
      [e.target.name]: e.target.value
    });

  }

  // SAVE PRODUCT
  async function handleSubmit(e) {

    e.preventDefault();

    if (saving) return;

    setSaving(true);

    const payload = {

      ProductName: form.productName,
      CategoryID: Number(form.categoryID),
      SubCategoryID: Number(form.subCategoryID),
      UnitPrice: Number(form.unitPrice),
      Inventory: Number(form.inventory),
      ProductKey: form.productKey

    };

    try {

      if (isEdit) {

        await updateProduct(id, payload);

      } else {

        await createProduct(payload);

      }

      alert(
        isEdit
          ? "Product updated successfully!"
          : "Product created successfully!"
      );

      navigate("/");

    } catch (err) {

      console.error("Save failed:", err);

      alert("Save failed — check console");

    } finally {

      setSaving(false);

    }
  }

  return (

    <div>

      <h2>
        {isEdit ? "Edit Product" : "Add Product"}
      </h2>

      <form onSubmit={handleSubmit}>

        <input
          required
          name="productName"
          placeholder="Product Name"
          value={form.productName}
          onChange={handleChange}
        />

        <br />
        <br />

        <input
          required
          type="number"
          name="categoryID"
          placeholder="Category ID"
          value={form.categoryID}
          onChange={handleChange}
        />

        <br />
        <br />

        <input
          required
          type="number"
          name="subCategoryID"
          placeholder="SubCategory ID"
          value={form.subCategoryID}
          onChange={handleChange}
        />

        <br />
        <br />

        <input
          required
          type="number"
          step="0.01"
          name="unitPrice"
          placeholder="Unit Price"
          value={form.unitPrice}
          onChange={handleChange}
        />

        <br />
        <br />

        <input
          required
          type="number"
          name="inventory"
          placeholder="Inventory"
          value={form.inventory}
          onChange={handleChange}
        />

        <br />
        <br />

        <input
          required
          name="productKey"
          placeholder="Product Key"
          value={form.productKey}
          onChange={handleChange}
        />

        <br />
        <br />

        <button
          type="submit"
          disabled={saving}
        >

          {saving
            ? "Saving..."
            : isEdit
            ? "Update"
            : "Create"}

        </button>

      </form>

    </div>
  );
}