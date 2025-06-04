#!/bin/bash

BASE_DIR="/home/pi/lab"
VENV_DIR="$BASE_DIR/venv"
REQUIREMENTS_FILE="$BASE_DIR/requirements.txt"

echo "📥 Actualizando repositorio general..."
cd "$BASE_DIR" || exit 1
git pull

echo "🐍 Verificando entorno virtual general..."
if [ ! -d "$VENV_DIR" ]; then
  echo "🟡 Entorno virtual no encontrado. Creando..."
  python3 -m venv "$VENV_DIR"
fi

echo "🧪 Activando entorno virtual general..."
source "$VENV_DIR/bin/activate"

echo "📦 Actualizando pip..."
pip install --upgrade pip

if [ -f "$REQUIREMENTS_FILE" ]; then
  echo "📦 Instalando dependencias desde $REQUIREMENTS_FILE..."
  pip install -r "$REQUIREMENTS_FILE"
else
  echo "⚠️ No se encontró $REQUIREMENTS_FILE, omitiendo instalación de dependencias."
fi

echo "🔄 Recargando configuración de systemd..."
sudo systemctl daemon-reload

echo "🔁 Reiniciando servicio lab_api..."
sudo systemctl restart lab_api.service

echo "✅ Actualización completa."