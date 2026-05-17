#!/bin/bash
# Guarda todos tus repositorios actuales

REPO_DIR="$HOME/Desktop/Fedora_sway/repo"
BACKUP_DIR="$REPO_DIR/backup"

# Crear carpeta si no existe
mkdir -p "$BACKUP_DIR"

# Copiar todos los repos
sudo cp -r /etc/yum.repos.d/* "$BACKUP_DIR/"

# Cambiar dueño para que puedas manejarlos después
sudo chown -R $USER:$USER "$BACKUP_DIR"

echo "✅ Repositorios respaldados en: $BACKUP_DIR"
echo "📦 Total: $(ls $BACKUP_DIR/*.repo 2>/dev/null | wc -l) archivos"
