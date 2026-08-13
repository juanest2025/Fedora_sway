#!/usr/bin/env bash

ANIME_DIR="$HOME/Desktop/anime"
BROWSER="brave-browser"

navigate() {

    local current_dir="$1"

    while true; do

        entries=()

        # Volver
        if [[ "$current_dir" != "$ANIME_DIR" ]]; then
            entries+=("← Volver")
        fi

        # Mostrar TODO lo que haya dentro de la carpeta
        while IFS= read -r item; do

            [[ -z "$item" ]] && continue

            name=$(basename "$item")

            if [[ -d "$item" ]]; then
                entries+=("📁 $name")
            else
                entries+=("$name")
            fi

        done < <(
            find "$current_dir" \
                -mindepth 1 \
                -maxdepth 1 \
                -printf '%p\n' |
            sort -V
        )

        # Si está vacío
        if [[ ${#entries[@]} -eq 0 ]]; then
            notify-send "Anime" "No hay contenido aquí."
            return
        fi

        # Fuzzel
        selection=$(
            printf '%s\n' "${entries[@]}" |
            fuzzel \
                --dmenu \
                --prompt="Anime > " \
                --width=80 \
                --lines=15
        )

        # ESC
        [[ -z "$selection" ]] && return

        # Volver
        if [[ "$selection" == "← Volver" ]]; then
            current_dir=$(dirname "$current_dir")
            continue
        fi

        # Quitar icono de carpeta
        clean_name="${selection#📁 }"

        target="$current_dir/$clean_name"

        # Si es carpeta → entrar
        if [[ -d "$target" ]]; then
            current_dir="$target"
            continue
        fi

        # Si es archivo → abrir con Brave
        if [[ -f "$target" ]]; then
            "$BROWSER" "$target" &
            return
        fi

    done
}

# Comprobar carpeta principal
if [[ ! -d "$ANIME_DIR" ]]; then
    notify-send \
        "Anime Browser" \
        "No existe: $ANIME_DIR"
    exit 1
fi

navigate "$ANIME_DIR"
