# Pipeline de migración (base segura)

Etapas definidas:

1. `01_extract`
2. `02_clean`
3. `03_transform`
4. `04_load`
5. `05_reconcile`
6. `06_validate`

## Principios

- `dry-run` por defecto
- checksums por lote
- auditoría por ejecución
- reversibilidad (sin escribir en fuentes reales en esta iteración)

## Ejecución de ejemplo

```bash
cd modernization
python migration/pipeline.py --stage 01_extract --dry-run
python migration/pipeline.py --stage 06_validate --dry-run
```

## Restricciones

- No conecta a bases reales.
- No incluye credenciales.
- No ejecuta SQL destructivo.
