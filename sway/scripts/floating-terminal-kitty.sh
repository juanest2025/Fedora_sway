#!/bin/bash

APP_ID="floating"

if swaymsg -t get_tree | jq -e ".. | objects | select(.app_id == \"$APP_ID\")" > /dev/null; then
    swaymsg "[app_id=\"$APP_ID\"] kill"
else
    kitty --class "$APP_ID"
fi
