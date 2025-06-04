#!/bin/bash

# Obtener directorio del script actual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Calcular la ruta al proyecto (dos niveles arriba + apps/leer-google-calc)
PROJECT_DIR="$(realpath "$SCRIPT_DIR/../apps/leer-google-calc")"

# Activar entorno virtual
source "$PROJECT_DIR/venv/bin/activate"

# Ejecutar script
cd "$PROJECT_DIR"
python scripts/run_task.py
