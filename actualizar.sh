#!/bin/bash

# Directorio del proyecto
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "🔄 Haciendo pull de cambios..."
git pull

echo "📦 Actualizando dependencias (si aplica)..."
source api/venv/bin/activate
pip install -r api/requirements.txt

echo "🔁 Reiniciando servicio lab_api.service..."
sudo systemctl restart lab_api.service

echo "✅ Proyecto actualizado y servicio reiniciado"
