#!/bin/bash

THEME_DIR="$HOME/.config/waybar/themes"
ACTIVE="$HOME/.config/waybar/style.css"

# Selector automático
if command -v fuzzel &>/dev/null; then
    SELECTOR="fuzzel --dmenu --prompt 'Waybar> '"
elif command -v rofi &>/dev/null; then
    SELECTOR="rofi -dmenu -p Waybar"
elif command -v wofi &>/dev/null; then
    SELECTOR="wofi --dmenu -p Waybar"
elif command -v fzf &>/dev/null; then
    SELECTOR="fzf"
else
    echo "Instala fuzzel, rofi, wofi o fzf"
    exit 1
fi

THEME=$(ls "$THEME_DIR" | eval $SELECTOR)

[ -z "$THEME" ] && exit

ln -sf "$THEME_DIR/$THEME" "$ACTIVE"

# Reload waybar
killall -SIGUSR2 waybar 2>/dev/null || {
    pkill waybar
    waybar &
} 
