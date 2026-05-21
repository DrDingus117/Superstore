import { useState, useEffect } from "react";
import { useParams} from "react-router";

export default function ProductDetail() {
    const { id } = useParams();
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    const [product, setProduct] = useState(null);

    useEffect(() => {
        const fetchProduct = async () => {
            setLoading(true);
            try {
                const data = await(`product/${id}`);
                setProduct(data);
            } catch (err) {
                setError(err.message);
            } finally {
                setLoading(false);
            }
        };

        fetchProduct();
    }, [id]);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error}</div>;
    if (!product) return <div>No product found.</div>;

    return (
        <div>
            <h2>Detail Product</h2>
              <link to={`/products/back/${product.productID}`}>
                <button>Back/</button>
              </link>
              <table>
                <tbody>
                    <tr>
                        <td>Name:</td>
                        <td>{product.productName}</td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td>{product.price}</td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>{product.category}</td>
                    </tr>
                    <tr>
                        <td>Sub-Category:</td>
                        <td>{product.subCategory}</td>
                    </tr>
                    <tr> 
                        <td>quantity:</td>
                        <td>{product.quantity}</td>
                    </tr>
                </tbody>
               </table>
            <p>Product details will be displayed here.</p>
        </div>
    );
}