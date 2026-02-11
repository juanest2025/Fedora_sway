#!/usr/bin/env bash
set -e

echo "▶ Instalando Google Chrome usando el paquete oficial (Fedora)"
echo "------------------------------------------------------------"

# 1. Instalar dependencias básicas
echo "▶ Instalando dependencias..."
sudo dnf install -y wget ca-certificates

# 2. Descargar paquete oficial de Google
echo "▶ Descargando Google Chrome..."
wget -O google-chrome.rpm \
https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# 3. Instalar Chrome (incluye repo automático)
echo "▶ Instalando Google Chrome Stable..."
sudo dnf install -y google-chrome.rpm

# 4. Limpiar archivos temporales
echo "▶ Limpiando archivos..."
rm -f google-chrome.rpm

echo "------------------------------------------------------------"
echo "✅ Google Chrome instalado correctamente"
echo "▶ Se actualizará automáticamente con: sudo dnf update"

