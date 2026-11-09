
#!/usr/bin/env bash

# ==========================================
# FUZZEL FILE MANAGER
# Navegación + Abrir con
# ==========================================
# juan

START_DIR="$HOME"

# ------------------------------------------
# Detectar aplicaciones
# ------------------------------------------

has_app() {
	command -v "$1" >/dev/null 2>&1
}

# ------------------------------------------
# Lanzar aplicaciones
# ------------------------------------------

launch_app() {
	local file="$1"
	shift

	setsid -f "$@" "$file" \
		>/dev/null 2>&1 </dev/null
}

# ------------------------------------------
# Obtener aplicaciones compatibles
# ------------------------------------------

get_apps() {

	local ext="${1##*.}"
	ext="${ext,,}"

	APPS=()
	COMMANDS=()

	case "$ext" in

	pdf)
		has_app brave-browser && {
			APPS+=("Brave")
			COMMANDS+=("brave-browser")
		}

		has_app google-chrome && {
			APPS+=("Google Chrome")
			COMMANDS+=("google-chrome")
		}

		has_app firefox && {
			APPS+=("Firefox")
			COMMANDS+=("firefox")
		}

		has_app evince && {
			APPS+=("Evince")
			COMMANDS+=("evince")
		}

		has_app okular && {
			APPS+=("Okular")
			COMMANDS+=("okular")
		}
		;;

	png | jpg | jpeg | webp | gif | bmp)
		has_app loupe && {
			APPS+=("Loupe")
			COMMANDS+=("loupe")
		}

		has_app ristretto && {
			APPS+=("Ristretto")
			COMMANDS+=("ristretto")
		}

		has_app gimp && {
			APPS+=("GIMP")
			COMMANDS+=("gimp")
		}
		;;

	mp4 | mkv | avi | mov | webm)
		has_app mpv && {
			APPS+=("MPV")
			COMMANDS+=("mpv")
		}

		has_app vlc && {
			APPS+=("VLC")
			COMMANDS+=("vlc")
		}

		has_app brave-browser && {
			APPS+=("Brave")
			COMMANDS+=("brave-browser")
		}

		has_app google-chrome && {
			APPS+=("Google Chrome")
			COMMANDS+=("google-chrome")
		}
		;;

	mp3 | wav | flac | ogg | m4a)
		has_app mpv && {
			APPS+=("MPV")
			COMMANDS+=("mpv")
		}

		has_app vlc && {
			APPS+=("VLC")
			COMMANDS+=("vlc")
		}
		;;

	txt | md | sh | py | cpp | c | h | json | conf | yaml | yml)
		has_app kitty && {
			APPS+=("Neovim (Kitty)")
			COMMANDS+=("kitty -e nvim")
		}

		has_app mousepad && {
			APPS+=("Mousepad")
			COMMANDS+=("mousepad")
		}
		;;

	html | htm)
		has_app brave-browser && {
			APPS+=("Brave")
			COMMANDS+=("brave-browser")
		}

		has_app google-chrome && {
			APPS+=("Google Chrome")
			COMMANDS+=("google-chrome")
		}

		has_app firefox && {
			APPS+=("Firefox")
			COMMANDS+=("firefox")
		}
		;;

	esac
}

# ------------------------------------------
# Menú Abrir con
# ------------------------------------------

open_alternative() {

	local file="$1"

	get_apps "$file"

	if [[ ${#APPS[@]} -eq 0 ]]; then
		notify-send "File Manager" "No hay aplicaciones alternativas disponibles"
		return 1
	fi

	local selection

	selection=$(
		printf '%s\n' "${APPS[@]}" |
			fuzzel \
				--dmenu \
				--prompt="Abrir con > " \
				--width=50 \
				--lines=10
	)

	# ESC: volver al menú anterior
	[[ -z "$selection" ]] && return 1

	for i in "${!APPS[@]}"; do

		if [[ "${APPS[$i]}" == "$selection" ]]; then

			case "${COMMANDS[$i]}" in

			"kitty -e nvim")
				launch_app "$file" kitty -e nvim
				;;

			*)
				launch_app "$file" "${COMMANDS[$i]}"
				;;

			esac

			return 0
		fi

	done

	return 1
}

# ------------------------------------------
# Menú principal del archivo
# ------------------------------------------

open_file() {

	local file="$1"
	local selection

	selection=$(
		printf '%s\n' \
			"Abrir (predeterminado)" \
			"Abrir con otra aplicación..." |
			fuzzel \
				--dmenu \
				--prompt="$(basename "$file") > " \
				--width=60 \
				--lines=5
	)

	case "$selection" in

	"Abrir (predeterminado)")
		setsid -f xdg-open "$file" \
			>/dev/null 2>&1 </dev/null
		return 0
		;;

	"Abrir con otra aplicación...")
		open_alternative "$file"
		return $?
		;;

	*)
		return 1
		;;

	esac
}

# ------------------------------------------
# Navegador de archivos
# ------------------------------------------

navigate() {

	local current_dir="$1"

	while true; do

		entries=()
		paths=()

		# Volver
		if [[ "$current_dir" != "$START_DIR" ]]; then
			entries+=("← Volver")
			paths+=("BACK")
		fi

		# Directorios y archivos
		while IFS= read -r -d '' item; do

			name=$(basename "$item")

			if [[ -d "$item" ]]; then
				entries+=("📁 $name")
			else
				entries+=("📄 $name")
			fi

			paths+=("$item")

		done < <(
			find "$current_dir" \
				-mindepth 1 \
				-maxdepth 1 \
				-print0 2>/dev/null |
				sort -z -f
		)

		# Directorio vacío
		if [[ ${#entries[@]} -eq 0 ]]; then
			notify-send "File Manager" "Directorio vacío"
			return
		fi

		# Menú Fuzzel
		selection=$(
			printf '%s\n' "${entries[@]}" |
				fuzzel \
					--dmenu \
					--prompt="$(basename "$current_dir") > " \
					--width=90 \
					--lines=20
		)

		# ESC
		[[ -z "$selection" ]] && return

		# Obtener índice
		selected_index=-1

		for i in "${!entries[@]}"; do

			if [[ "${entries[$i]}" == "$selection" ]]; then
				selected_index=$i
				break
			fi

		done

		[[ "$selected_index" -eq -1 ]] && continue

		target="${paths[$selected_index]}"

		# Volver
		if [[ "$target" == "BACK" ]]; then
			current_dir=$(dirname "$current_dir")
			continue
		fi

		# Entrar en carpeta
		if [[ -d "$target" ]]; then
			current_dir="$target"
			continue
		fi

		# Abrir archivo y cerrar gestor
		if [[ -f "$target" ]]; then

			if open_file "$target"; then
				return 0
			fi

		fi

	done
}

navigate "$START_DIR"

