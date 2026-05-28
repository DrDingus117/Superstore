import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav style={{ padding: "10px", borderBottom: "1px solid #ccc" }}>
      <Link to="/">Products</Link>{" | "}
      <Link to="/add">Add Product</Link>
    </nav>
  );
}