#!/usr/bin/env bash

FILE="brew-leaves.txt"

# Verificar que brew exista
if ! command -v brew >/dev/null; then
  echo "brew no está instalado"
  exit 1
fi

echo "Guardando lista de paquetes..."
brew leaves > "$FILE"

echo "Instalando paquetes desde la lista..."
while read -r pkg; do
  brew install "$pkg"
done < "$FILE"

echo "Listo ✔"

