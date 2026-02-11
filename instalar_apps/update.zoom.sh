#!/usr/bin/env bash

set -e

echo "📥 Descargando Zoom para Fedora (64-bit)..."

URL="https://zoom.us/client/latest/zoom_x86_64.rpm"
FILE="zoom_x86_64.rpm"

# Descargar
wget -O "$FILE" "$URL"

echo "📦 Instalando Zoom..."

# Instalar con dnf
sudo dnf install -y "$FILE"

# Limpiar
rm -f "$FILE"

echo "✅ Zoom actualizado correctamente."

