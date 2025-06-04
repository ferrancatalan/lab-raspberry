#!/bin/bash

# Ruta al directorio del proyecto
PROJECT_DIR="/home/pi/lab/api"

echo "📥 Actualizando repositorio..."
cd "$PROJECT_DIR" || exit 1
git pull

echo "🐍 Verificando entorno virtual..."
if [ ! -d "venv" ]; then
  echo "🟡 Entorno virtual no encontrado. Creando..."
  python3 -m venv venv
fi

echo "🧪 Activando entorno virtual..."
source venv/bin/activate

echo "📦 Actualizando pip y generando requirements.txt..."
pip install --upgrade pip
pip freeze > requirements.txt

echo "📦 Instalando dependencias..."
pip install -r requirements.txt

echo "🔁 Reiniciando servicio lab_api..."
sudo systemctl restart lab_api.service

echo "✅ Actualización completa."
