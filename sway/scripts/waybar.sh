#!/usr/bin/env bash

# Mata cualquier instancia previa de waybar
pkill waybar

# Pequeña pausa para evitar race conditions
sleep 0.3

# Lanza waybar
waybar &

