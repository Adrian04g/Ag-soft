import { useEffect, useState } from "react";

type Product = { id: string; sku: string; name: string; price: number; taxRate: number };

const apiBase = import.meta.env.VITE_API_BASE_URL ?? "http://localhost:8080";

export default function App() {
  const [products, setProducts] = useState<Product[]>([]);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch(`${apiBase}/health`)
      .then((response) => {
        if (!response.ok) throw new Error(`API health check failed: ${response.status}`);
        return fetch(`${apiBase}/api/v1/products`);
      })
      .then((response) => {
        if (!response.ok) throw new Error(`Product request failed: ${response.status}`);
        return response.json() as Promise<Product[]>;
      })
      .then(setProducts)
      .catch((reason: unknown) => setError(reason instanceof Error ? reason.message : "Unknown error"));
  }, []);

  return (
    <main>
      <header>
        <p className="eyebrow">GlobalSoft Modernization</p>
        <h1>Panel administrativo</h1>
        <p>Base inicial para consultar catálogos desde la API central.</p>
      </header>
      <section>
        <h2>Productos</h2>
        {error && <p className="error">{error}</p>}
        {!error && products.length === 0 && <p>No hay productos cargados.</p>}
        <ul>
          {products.map((product) => (
            <li key={product.id}>
              <strong>{product.sku}</strong> {product.name} — {product.price.toFixed(2)}
            </li>
          ))}
        </ul>
      </section>
    </main>
  );
}
