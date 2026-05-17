#!/bin/bash
# Restaura todos tus repositorios en un Fedora nuevo

REPO_DIR="$HOME/.dotfiles/repos"
BACKUP_DIR="$REPO_DIR/backups"

# Verificar que exista el backup
if [ ! -d "$BACKUP_DIR" ] || [ -z "$(ls -A $BACKUP_DIR/*.repo 2>/dev/null)" ]; then
    echo "❌ No se encontraron backups en $BACKUP_DIR"
    exit 1
fi

# Copiar repos al sistema
sudo cp -f "$BACKUP_DIR"/*.repo /etc/yum.repos.d/ 2>/dev/null

# Limpiar caché y regenerar
sudo dnf clean all
sudo dnf makecache

echo "✅ Repositorios restaurados exitosamente!"
echo "📦 Restaurados: $(ls $BACKUP_DIR/*.repo 2>/dev/null | wc -l) repositorios"
