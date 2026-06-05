const BASE_URL = "http://api.local/api";

async function handleResponse(res) {
  if (!res.ok) {
    const text = await res.text();
    throw new Error(text || "Request failed");
  }
  return res.json();
}

export async function getProducts() {
  const res = await fetch(`${BASE_URL}/api/products`);
  return handleResponse(res);
}

export async function getProduct(id) {
  const res = await fetch(`${BASE_URL}/api/products/${id}`);
  return handleResponse(res);
}

export async function createProduct(product) {
  const res = await fetch(`${BASE_URL}/api/products`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(product),
  });

  return handleResponse(res);
}

export async function updateProduct(id, product) {
  const res = await fetch(`${BASE_URL}/api/products/${id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(product),
  });

  return handleResponse(res);
}

export async function deleteProduct(id) {
  const res = await fetch(`${BASE_URL}/api/products/${id}`, {
    method: "DELETE",
  });

  return handleResponse(res);
}