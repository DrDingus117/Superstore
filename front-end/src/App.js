import {
  Routes,
  Route,
  Link
} from "react-router-dom";

import ProductList from "./components/ProductList";
import ProductForm from "./components/ProductForm";
import ProductDetails from "./components/ProductDetails";

export default function App() {

  return (

    <div style={{ padding: "20px" }}>

      <h1>Superstore Product Manager</h1>

      <nav style={{ marginBottom: "15px" }}>

        <Link to="/">
          Home
        </Link>

        {" | "}

        <Link to="/add">
          Add Product
        </Link>

      </nav>

      <hr />

      <Routes>

        <Route
          path="/"
          element={<ProductList />}
        />

        <Route
          path="/add"
          element={<ProductForm />}
        />

        <Route
          path="/edit/:id"
          element={<ProductForm />}
        />

        <Route
          path="/products/:id"
          element={<ProductDetails />}
        />

      </Routes>

    </div>
  );
}