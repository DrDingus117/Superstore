import {
  Routes,
  Route,
  Link
} from "react-router-dom";

import List from "./components/Product/List";
import Add from "./components/Product/Add";
import Edit from "./components/Product/Edit";
import Detail from "./components/Product/Detail";

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
          element={<List />}
        />

        <Route
          path="/add"
          element={<Add />}
        />

        <Route
           path="/edit/:id"
           element={<Edit />}
/>

        <Route
          path="/products/:id"
          element={<Detail />}
        />

      </Routes>

    </div>
  );
}