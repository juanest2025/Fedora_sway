#!/bin/bash

WALLPAPER=$(find ~/wallpaper -type f | shuf -n 1)
pkill swaybg

swaybg -i "$WALLPAPER" -m fill &
