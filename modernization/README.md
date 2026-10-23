# Modernización incremental de GlobalSoft

Esta carpeta contiene una base **ejecutable, aislada y reversible** para modernizar el legado Visual FoxPro/SQL Server sin modificar archivos históricos.

## Alcance de esta iteración

- Fase 1: descubrimiento documentado del legado.
- Fase 2: modelo de dominio inicial independiente del esquema legado.
- Fase 3: arquitectura base y ADR de tecnología local.
- Fase 4/5 (base): API ASP.NET Core + PostgreSQL + OpenAPI + health + sincronización idempotente inicial.
- Pipeline de migración por etapas en modo seguro `dry-run`.
- CI básica para build/test y validación de archivos prohibidos.

## Estructura

- `src/GlobalSoft.Modernization.Api`: API central (REST/OpenAPI/health/sync).
- `src/GlobalSoft.Modernization.Local`: local SQLite bootstrap for offline operation.
- `admin-web`: frontend administrativo React + TypeScript.
- `tests/GlobalSoft.Modernization.Api.Tests`: pruebas automatizadas.
- `docs/`: descubrimiento, dominio, arquitectura y decisiones.
- `migration/`: etapas `01_extract..06_validate` en modo auditable.
- `scripts/`: utilidades de validación local.

## Requisitos

- .NET SDK 8+
- Docker y Docker Compose
- Node.js 22+ (solo para `admin-web`)

## Ejecución local rápida

```bash
cd modernization
dotnet test
```

Build local del frontend:

```bash
cd admin-web
npm install
npm run build
```

## Levantar con Docker Compose

```bash
cd modernization
docker compose up --build
```

API (desarrollo):
- Health: `http://localhost:8080/health`
- OpenAPI/Swagger: `http://localhost:8080/swagger`

## Variables y seguridad

- No se incluyen credenciales reales.
- `Authentication:Authority` y `Authentication:Audience` son placeholders para OIDC.
- `ConnectionStrings:Postgres` debe configurarse por entorno.

## Limitaciones actuales

- La app web y la app local son todavía una base funcional mínima, no un POS listo para producción.
- La sincronización registra operaciones y ofrece push/pull; todavía no procesa todas las reglas de negocio.
- Esta iteración no conecta ni migra datos reales del legado.
- Se priorizó la base segura y auditable para continuar en incrementos.
