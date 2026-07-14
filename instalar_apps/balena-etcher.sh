#!/usr/bin/env bash

set -euo pipefail

# Comprobar arquitectura
ARCH=$(uname -m)
if [[ "$ARCH" != "x86_64" ]]; then
    echo "❌ Este script solo soporta Fedora x86_64."
    exit 1
fi

echo "🔍 Buscando la última versión de Balena Etcher..."

URL=$(curl -s https://api.github.com/repos/balena-io/etcher/releases/latest \
    | grep browser_download_url \
    | grep x86_64.rpm \
    | cut -d '"' -f 4)

if [[ -z "$URL" ]]; then
    echo "❌ No se pudo obtener el enlace de descarga."
    exit 1
fi

FILE=$(basename "$URL")

echo "⬇️ Descargando $FILE..."
curl -L -o "$FILE" "$URL"

echo "📦 Instalando..."
sudo dnf install -y "./$FILE"

echo "🧹 Limpiando..."
rm -f "$FILE"

echo "✅ Balena Etcher se instaló correctamente."
