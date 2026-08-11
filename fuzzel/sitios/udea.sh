#!/bin/bash

declare -A sites=(
    ["Calculo integral"]="https://udearroba.udea.edu.co/internos/course/view.php?id=26948"
    ["Fisica Mecanica"]="https://udearroba.udea.edu.co/internos/course/view.php?id=26186"
    ["Ingles V"]="https://virtualingenieriaudea.co/course/view.php?id=4969"
    ["Algebra lineal"]="https://udearroba.udea.edu.co/internos/course/view.php?id=27000"
)

selection=$(printf "%s\n" "${!sites[@]}" | sort | fuzzel --dmenu --prompt="Materias: ")

if [ -n "$selection" ]; then
    google-chrome-stable "${sites[$selection]}" &
fi

