#!/bin/bash

# ============================================================
# Desinstalador de paquetes - Entorno Sway (Fedora / DNF)
# Desinstala paquete por paquete y continúa si alguno falla.
# ============================================================

if [[ $EUID -eq 0 ]]; then
	echo "Ejecuta el script como usuario normal, sin sudo."
	exit 1
fi

FALLIDOS=()
ELIMINADOS=()

PAQUETES=(
	# Entorno Sway
	sway waybar kitty wofi wlogout swaylock swayidle swaybg
	fuzzel swaync hyprlock

	# Utilidades del sistema
	brightnessctl pipewire pipewire-pulse playerctl upower
	network-manager-gnome nm-connection-editor blueman

	# Herramientas Wayland
	grim slurp wl-clipboard gammastep

	# Notificaciones y montaje
	mako-notifier cliphist udiskie

	# Terminal / línea de comandos
	ranger vim neovim fzf htop bat ripgrep fd zsh
	btop wget curl git zathura zathura-pdf-poppler

	# Audio y video
	pavucontrol vlc celluloid ffmpeg cmus cava showtime mpv

	# Batería / energía
	tlp powertop

	# Compatibilidad X11
	xwayland x11-utils

	# Compresión y archivos
	zip unrar p7zip-full file-roller nemo-fileroller

	# Otras aplicaciones
	cheese gnome-clocks gnome-chess eom foliate wf-recorder
)

echo "============================================================"
echo "       DESINSTALADOR - ENTORNO SWAY / FEDORA"
echo "============================================================"
echo ""
echo "Se intentará eliminar ${#PAQUETES[@]} paquetes."
echo "Las configuraciones personales no serán eliminadas."
echo ""

read -rp "¿Deseas continuar? [s/N]: " RESPUESTA

[[ "$RESPUESTA" =~ ^[sS]$ ]] || {
	echo "Operación cancelada."
	exit 0
}

echo ""

for pkg in "${PAQUETES[@]}"; do
	echo "==> Desinstalando: $pkg"

	if ! rpm -q "$pkg" &>/dev/null; then
		echo "    No está instalado. Se omite."
		continue
	fi

	if sudo dnf remove -y "$pkg"; then
		ELIMINADOS+=("$pkg")
	else
		echo "    !!! No se pudo desinstalar: $pkg"
		FALLIDOS+=("$pkg")
	fi

	echo ""
done

echo ""
echo "============================================================"
echo "                 RESUMEN FINAL"
echo "============================================================"

echo "Desinstalados correctamente: ${#ELIMINADOS[@]}"
echo "No se pudieron desinstalar: ${#FALLIDOS[@]}"

if [[ ${#FALLIDOS[@]} -gt 0 ]]; then
	echo ""
	echo "Paquetes pendientes:"
	printf '  - %s\n' "${FALLIDOS[@]}"
fi

echo ""
echo "Proceso finalizado."
echo "============================================================"
