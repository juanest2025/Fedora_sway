#!/bin/bash

set -e

echo "📦 Instalando Zellij (binario oficial)..."

cd /tmp || exit 1

echo "⬇️ Descargando..."
curl -LO https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz

echo "📂 Descomprimiendo..."
tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz

echo "🚚 Moviendo a /usr/local/bin..."
sudo mv zellij /usr/local/bin/

echo "🔐 Dando permisos..."
sudo chmod +x /usr/local/bin/zellij

echo "✅ Instalación completada."

echo "👉 Ejecuta: zellij"

