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

# Backup incremental
for CONFIG in "${CONFIGS[@]}"; do

	ORIGIN="$SOURCE/$CONFIG"
	TARGET="$DEST/$CONFIG"

	# Comprobar que exista el origen
	[[ -e "$ORIGIN" ]] || continue

	# Buscar archivos y copiar únicamente los nuevos o modificados
	find "$ORIGIN" -type f | while IFS= read -r FILE; do

		RELATIVE="${FILE#"$ORIGIN"/}"
		DEST_FILE="$TARGET/$RELATIVE"

		mkdir -p "$(dirname "$DEST_FILE")"

		if [[ ! -f "$DEST_FILE" ]] || ! cmp -s "$FILE" "$DEST_FILE"; then
			cp -p "$FILE" "$DEST_FILE"
		fi

	done

done

# Abrir Kitty con Ranger
#exec kitty -e bash -c 'cd "$HOME/Desktop/Fedora_sway" && ranger'
kitty --directory "$HOME/Desktop/Fedora_sway"
