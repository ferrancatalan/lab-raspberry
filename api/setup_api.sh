#!/bin/bash

echo "📦 Preparando API..."

cd "$(dirname "$0")"

if [ ! -f ./venv/bin/activate ]; then
  echo "❌ Entorno virtual no encontrado en ./venv"
  exit 1
fi

echo "✅ Activando entorno virtual..."
source ./venv/bin/activate

echo "📦 Instalando dependencias..."
pip install -r requirements.txt

echo "🚀 Lanzando API..."
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
