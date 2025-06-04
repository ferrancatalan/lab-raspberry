#!/bin/bash

# Obtener directorio del script actual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Calcular la ruta al proyecto específico (dos niveles arriba + apps/leer-google-calc)
PROJECT_DIR="$(realpath "$SCRIPT_DIR/../apps/leer-google-calc")"

# Ruta al entorno virtual general usando variable HOME
VENV_DIR="$HOME/lab/venv"

# Activar entorno virtual general
source "$VENV_DIR/bin/activate"

# Ejecutar script desde el directorio de la app
cd "$PROJECT_DIR"
python scripts/run_task.py

# Desactivar entorno virtual al terminar (opcional)
deactivate
