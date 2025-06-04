#!/bin/bash

# Obtener ruta absoluta del directorio donde está el script
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
  echo "🟡 Creando entorno virtual..."
  python3 -m venv venv || { echo "Error creando entorno virtual"; exit 1; }
else
  echo "✅ Entorno virtual ya existe"
fi

# Activar entorno virtual para el resto del script
echo "🟢 Activando entorno virtual..."
# shellcheck source=/dev/null
source venv/bin/activate || { echo "Error activando entorno virtual"; exit 1; }

# Actualizar pip y luego instalar dependencias
echo "📦 Instalando dependencias con pip del entorno virtual..."
pip install --upgrade pip || { echo "Error actualizando pip"; exit 1; }
pip install -r requirements.txt || { echo "Error instalando requirements"; exit 1; }

echo "✅ Entorno listo. Usa 'source venv/bin/activate' para activarlo en futuras sesiones."
