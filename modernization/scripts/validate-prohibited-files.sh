#!/usr/bin/env bash
set -euo pipefail

patterns=(
  '*.bak' '*.BAK' '*.mdf' '*.ndf' '*.ldf' '*.dbf' '*.fpt' '*.dll' '*.exe' '*.fxp' '*.rar' '*.zip'
)

status=0
for pattern in "${patterns[@]}"; do
  if git ls-files "$pattern" | grep -q .; then
    echo "Archivo prohibido detectado: $pattern"
    git ls-files "$pattern"
    status=1
  fi
done

exit "$status"
