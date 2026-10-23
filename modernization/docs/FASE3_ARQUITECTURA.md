# Fase 3 — Arquitectura técnica base

## Decisión de aplicación local

Se elige **.NET moderno** (iteración siguiente) sobre Tauri para maximizar continuidad del equipo C#/SQL heredado, reutilización de dominio y soporte robusto de integración local (impresoras, lectores, cajón), manteniendo SQLite offline.

## Componentes

- API central ASP.NET Core (esta iteración)
- PostgreSQL central (esta iteración)
- Cliente web React+TypeScript (siguiente iteración)
- App local .NET + SQLite (siguiente iteración)
- Servicio de sincronización idempotente (base en API actual)

## Seguridad y configuración

- OIDC/OAuth2 preparado sin secretos embebidos.
- Configuración por variables de entorno.
- ProblemDetails + correlación (`X-Correlation-Id`).

## Observabilidad

- Logging estructurado JSON.
- Health checks en `/health`.
- Auditoría inicial por endpoint.

## Versionado API

- Prefijo `api/v1`.

## Despliegue desarrollo

- `docker-compose.yml` con PostgreSQL + API.

## Límites explícitos

- Frontend consume solo API (sin acceso directo a DB).
- Local POS sincroniza contra API (sin escribir DB central).
