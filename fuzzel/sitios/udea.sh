#!/bin/bash

declare -A sites=(
	["Ude@"]="https://udearroba.udea.edu.co/internos/my/"
	["Ingeni@"]="https://virtualingenieriaudea.co/my/"
	["Calculo integral"]="https://udearroba.udea.edu.co/internos/course/view.php?id=26948"
	["Fisica Mecanica"]="https://udearroba.udea.edu.co/internos/course/view.php?id=26186"
	["Ingles V"]="https://virtualingenieriaudea.co/course/view.php?id=4969"
	["Algebra lineal"]="https://udearroba.udea.edu.co/internos/course/view.php?id=27000"
	["Classroom Fisica"]="https://classroom.google.com/c/ODc0MzgwMTMwMTMy"
	["Quiz Fisica 12:30 noche"]="https://classroom.google.com/c/ODc0MzgwMTMwMTMy/a/ODc0MzgwMTMwMTQ2/details"
	["Entrega podcast"]="https://virtualingenieriaudea.co/mod/assign/view.php?id=874268"
	["Parcial Ingles listening"]="https://virtualingenieriaudea.co/mod/quiz/view.php?id=875608"
	["Parcial Ingles writting"]="https://virtualingenieriaudea.co/mod/quiz/view.php?id=875610"
	["Grabaciones ingles"]="https://ingenia.udea.edu.co/zoom/meeting/97057341996"
	["Texto Writting ingles"]="https://docs.google.com/document/d/1GQouVjBL0N5SmQNNAHZpdU8JYdqaxU5iMB57ftnFP7o/edit?usp=sharing"
	["Entregea Essay ingles"]="https://virtualingenieriaudea.co/mod/assign/view.php?id=875054"
	["Internet and microprosessors ingles"]="https://docs.google.com/document/d/1I2kRiyvS8JGJjcL5UUbRcjP34yT9xUkZU5IjgH4a33A/edit?usp=sharing"
	["Borrador Essay ingles"]="https://docs.google.com/document/d/1mBsXhira4rsv-T8uuRX2f8yULdEIMlkxPjGnGgWtUR0/edit?usp=sharing"
	["Drive Ingles"]="https://udeaeduco-my.sharepoint.com/shared?listurl=https%3A%2F%2Fudeaeduco%2Dmy%2Esharepoint%2Ecom%2Fpersonal%2Faracelly%5Fospina%5Fudea%5Fedu%5Fco%2FDocuments&e=5%3Abb3aac9a086840b9859382a8c185882f&sharingv2=true&fromShare=true&at=9&id=%2Fpersonal%2Faracelly%5Fospina%5Fudea%5Fedu%5Fco%2FDocuments%2F2026%2D2%20EforE%20students%2FEnglish%20V%2FGroup%2018%20%2D%202026%2D2&FolderCTID=0x012000A5F08FC96EEC3B468C71B876883C6992"
	["Dilema ingles"]="https://docs.google.com/document/d/1tIoOwobtLm7cDmI8BQcuXtXNz9OrGW4SZzvTZsTHuoc/edit?usp=sharing"

	["All subjets UdeA"]="all.sh"
)

selection=$(printf "%s\n" "${!sites[@]}" | sort | fuzzel --dmenu --prompt="Materias: ")

if [ "$selection" = "All subjets UdeA" ]; then
	bash "$(dirname "$0")/all.sh"
elif [ -n "$selection" ]; then
	google-chrome-stable "${sites[$selection]}" &
fi
