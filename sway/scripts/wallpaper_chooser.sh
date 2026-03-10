#!/bin/bash

DIR="/home/juanes/wallpaper"

WALL=$(ls "$DIR" | wofi --show dmenu --prompt "Wallpaper")

if [ -n "$WALL" ]; then
    pkill swaybg
    swaybg -i "$DIR/$WALL" -m fill &
fi
