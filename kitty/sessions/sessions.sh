#!/usr/bin/env bash

SESSIONS="$HOME/.config/kitty/sessions"
RUNTIME="${XDG_RUNTIME_DIR:-/tmp}/kitty-sessions-$UID"
mkdir -p "$SESSIONS" "$RUNTIME"

accion=$(printf '%s\n' \
	"Crear sesión" \
	"Abrir sesión" \
	"Cerrar sesión" \
	"Listar sesiones activas" |
	fzf --prompt="Kitty > " --height=40% --reverse) || exit 0

case "$accion" in

"Crear sesión")
	nombre=$(printf '' | fzf --print-query --prompt="Nombre de la sesión: " |
		head -n 1)

	# Si fzf no devuelve un nombre, cancelar.
	[[ -z "$nombre" ]] && exit 0

	# Evitar caracteres problemáticos en el nombre del archivo.
	nombre=$(printf '%s' "$nombre" | tr -cd '[:alnum:]_.-')

	[[ -z "$nombre" ]] && exit 0

	archivo="$SESSIONS/$nombre.conf"

	if [[ -e "$archivo" ]]; then
		notify-send "Kitty Sessions" "Esa sesión ya existe." 2>/dev/null
		exit 1
	fi

	cat >"$archivo" <<'EOF'
layout tall
launch
launch
EOF

	notify-send "Kitty Sessions" "Sesión '$nombre' creada." 2>/dev/null ||
		printf 'Sesión creada: %s\n' "$archivo"
	;;

"Abrir sesión")
	archivo=$(find "$SESSIONS" -maxdepth 1 -type f -name '*.conf' \
		-printf '%f\n' | sort |
		fzf --prompt="Abrir > " --reverse) || exit 0

	nombre="${archivo%.conf}"
	kitty --session "$SESSIONS/$archivo" &
	pid=$!

	printf '%s\n' "$nombre" >"$RUNTIME/$pid"
	;;

"Cerrar sesión" | "Listar sesiones activas")
	opciones=()

	for registro in "$RUNTIME"/*; do
		[[ -f "$registro" ]] || continue
		pid="${registro##*/}"

		if kill -0 "$pid" 2>/dev/null &&
			[[ "$(ps -p "$pid" -o comm= 2>/dev/null | xargs)" == kitty ]]; then
			nombre=$(cat "$registro")
			opciones+=("$nombre | PID $pid")
		else
			rm -f "$registro"
		fi
	done

	if ((${#opciones[@]} == 0)); then
		notify-send "Kitty Sessions" "No hay sesiones registradas activas." 2>/dev/null ||
			printf '%s\n' "No hay sesiones registradas activas."
		exit 0
	fi

	if [[ "$accion" == "Listar sesiones activas" ]]; then
		printf '%s\n' "${opciones[@]}" |
			fzf --prompt="Activas > " --reverse
	else
		seleccion=$(printf '%s\n' "${opciones[@]}" |
			fzf --prompt="Cerrar > " --reverse) || exit 0

		pid=$(printf '%s\n' "$seleccion" |
			sed -n 's/.*PID \([0-9][0-9]*\)$/\1/p')

		if [[ -n "$pid" && -f "$RUNTIME/$pid" ]]; then
			if [[ "$(ps -p "$pid" -o comm= 2>/dev/null | xargs)" == kitty ]]; then
				kill "$pid"
			fi
			rm -f "$RUNTIME/$pid"
		fi
	fi
	;;
esac
