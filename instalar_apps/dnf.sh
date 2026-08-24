#!/bin/bash

# ============================================================
# Script de instalación - Entorno Sway (Fedora / dnf)
# Instala paquete por paquete: si uno falla, sigue con el resto
# y al final muestra un resumen de lo que no se pudo instalar.
# ============================================================

FALLIDOS=()

instalar() {
    local pkg="$1"
    echo "==> Instalando: $pkg"
    if ! sudo dnf install -y "$pkg"; then
        echo "!!! Falló: $pkg"
        FALLIDOS+=("$pkg")
    fi
}

# --- Actualizar sistema ---
sudo dnf update -y
sudo dnf upgrade -y

PAQUETES=(
    # Entorno Sway (compositor, barra, lanzador, bloqueo)
    sway waybar kitty wofi wlogout swaylock swayidle swaybg
    fuzzel wob swaync hyprlock

    # Utilidades del sistema (brillo, audio, red, energía)
    brightnessctl pipewire pipewire-pulse playerctl upower
    network-manager-gnome nm-connection-editor blueman

    # Herramientas Wayland (capturas, portapapeles, temp. color)
    grim slurp wl-clipboard gammastep

    # Notificaciones y montaje de discos
    mako-notifier cliphist udiskie

    # Terminal / línea de comandos
    ranger vim neovim fzf htop bat ripgrep fd zsh btop wget curl git

    # Audio y video
    pavucontrol vlc celluloid ffmpeg cmus cava

    # Batería / energía
    tlp powertop

    # Compatibilidad X11
    xwayland x11-utils

    # Compresión y archivos
    zip unrar p7zip-full file-roller nemo-fileroller

    # Otras utilidades / apps
    cheese gnome-clocks gnome-chess eom foliate
)

for pkg in "${PAQUETES[@]}"; do
    instalar "$pkg"
done

# --- Resumen final ---
echo ""
echo "============================================================"
if [ ${#FALLIDOS[@]} -eq 0 ]; then
    echo "Instalación finalizada sin errores."
else
    echo "Instalación finalizada con errores en los siguientes paquetes:"
    for pkg in "${FALLIDOS[@]}"; do
        echo "  - $pkg"
    done
    echo "Revisá el nombre del paquete o si necesita un repo extra (ej: RPM Fusion)."
fi
echo "============================================================"
