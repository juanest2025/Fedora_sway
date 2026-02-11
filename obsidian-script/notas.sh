#!/bin/bash

cd "$HOME/Documents/Second_Brain/Notas_Rapidas" || exit

read -p "Cual es el nombre de la nota?: " one

nvim "$one.md"

