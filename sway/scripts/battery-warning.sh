#!/bin/bash

BAT=$(upower -e | grep BAT)

NOTIFIED=0

while true; do
    LEVEL=$(upower -i "$BAT" | awk '/percentage/ {gsub("%",""); print $2}')
    STATE=$(upower -i "$BAT" | awk -F': ' '/state/ {print $2}')

    if [[ "$STATE" == "discharging" && "$LEVEL" -le 15 && "$NOTIFIED" -eq 0 ]]; then
        notify-send \
            -u critical \
            "🪫 Batería baja" \
            "Queda ${LEVEL}% de batería. Conecta el cargador."
        NOTIFIED=1
    fi

    if [[ "$LEVEL" -gt 15 ]]; then
        NOTIFIED=0
    fi

    sleep 30
done
