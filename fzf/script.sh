#!/bin/bash

# Buscar archivo con fzf
file=$(find . -type f 2>/dev/null | fzf --preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}')

# Si no eligió nada, salir
[ -z "$file" ] && exit 0

# Obtener extensión
ext="${file##*.}"

# Abrir según tipo
case "$ext" in

  txt|md|py|c|cpp|h|java|sh|json|yml|yaml|html|css|js)
    nvim "$file"
    ;;

  jpg|jpeg|png|gif|webp|bmp)
    feh "$file" 2>/dev/null || xdg-open "$file"
    ;;

  mp4|mkv|avi|mov|webm|mp3|wav|flac)
    vlc "$file" 2>/dev/null || mpv "$file"
    ;;

  pdf)
    zathura "$file" 2>/dev/null || xdg-open "$file"
    ;;

  *)
    xdg-open "$file"
    ;;
esac

