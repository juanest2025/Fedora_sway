#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
FILE="$DIR/$(date '+%Y-%m-%d_%H-%M-%S').png"

mkdir -p "$DIR"

case "$1" in
  full)
    grim "$FILE"
    wl-copy < "$FILE"
    ;;
  area)
    grim -g "$(slurp)" "$FILE"
    wl-copy < "$FILE"
    ;;
esac
