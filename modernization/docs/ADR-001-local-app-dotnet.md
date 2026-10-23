# ADR-001: Selección de aplicación local .NET moderno

## Estado
Aceptado (base de modernización)

## Contexto
Se requiere app local con operación offline, SQLite y soporte de periféricos POS sin depender de Visual FoxPro.

## Decisión
Adoptar stack **.NET moderno** para la app local inicial.

## Consecuencias

- Pros:
  - Reutilización de conocimiento C# y modelo de dominio compartido con API.
  - Integración más directa con hardware local en Windows.
  - Testing unificado en ecosistema .NET.
- Contras:
  - UI multiplataforma requiere decisión adicional (Avalonia/MAUI/WPF).

## Alternativas consideradas

- Tauri: viable, pero mayor fragmentación tecnológica para equipo actual y capa nativa adicional para hardware POS.
