
#!/usr/bin/env bash

SOURCE="$HOME/.config"
DEST="$HOME/Desktop/Fedora_sway"

# Carpetas que queremos respaldar
CONFIGS=(
    fuzzel
    fzf
    kitty
    mako
    nvim
    obsidian-script
    ranger
    repr_video
    sway
    swaync
    waybar
    zellij
)

mkdir -p "$DEST"

# Copiar todas las carpetas y sobrescribir archivos existentes
for CONFIG in "${CONFIGS[@]}"; do

    ORIGIN="$SOURCE/$CONFIG"
    TARGET="$DEST/$CONFIG"

    # Comprobar que exista el origen
    [[ -d "$ORIGIN" ]] || continue

    mkdir -p "$TARGET"

    cp -a "$ORIGIN/." "$TARGET/"

done

# Abrir Kitty en el destino
kitty --directory "$DEST"

