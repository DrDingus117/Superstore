const BASE_URL = "http://localhost:5014/api";

async function handleResponse(res) {
  if (!res.ok) {
    const text = await res.text();
    throw new Error(text || "Request failed");
  }
  return res.json();
}

export async function get(path) {
  const res = await fetch(`${BASE_URL}/${path}`);
  return handleResponse(res);
}

export async function getById(path, id) {
  const res = await fetch(`${BASE_URL}/${path}/${id}`);
  return handleResponse(res);
}

export async function create(path, data) {
  const res = await fetch(`${BASE_URL}/${path}`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });

  return handleResponse(res);
}

export async function update(path, id, data) {
  const res = await fetch(`${BASE_URL}/${path}/${id}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });

  return handleResponse(res);
}

export async function remove(path, id) {
  const res = await fetch(`${BASE_URL}/${path}/${id}`, {
    method: "DELETE" 
  });

  return handleResponse(res);
}