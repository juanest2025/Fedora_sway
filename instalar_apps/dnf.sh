#!/bin/bash

sudo dnf update && sudo dnf upgrade -y

# entorno de sway
sudo dnf install -y \
sway waybar kitty wofi wlogout swaylock swayidle
sudo dnf install swaybg -y 


# sistema de utilidades
sudo dnf install -y \
brightnessctl pipewire pipewire-pulse playerctl upower \
network-manager-gnome nm-connection-editor blueman

# herramientas wayland
sudo dnf install -y \
grim slurp wl-clipboard gammastep

# notificaciones
sudo dnf install -y \
mako-notifier cliphist udiskie

# terminal
sudo dnf install -y \
ranger vim neovim fzf htop bat ripgrep

# audio video
sudo dnf install -y \
pavucontrol vlc celluloid ffmpeg

# bluetooth
sudo dnf install -y blueman

# bataria
sudo dnf install -y \
tlp powertop

# compatibilidad X11
sudo dnf install -y xwayland

# utilidades del sistemas
sudo dnf install zsh -y 
#para escuchar musica
sudo dnf install cmus -y 
sudo dnf install zip -y 
sudo dnf install rar -y 
sudo dnf install unrar p7zip-full file-roller -y
sudo dnf install nemo-fileroller
sudo dnf install unrar -y
sudo dnf install ranger -y 
sudo dnf install kitty -y 
sudo dnf install gammastep -y 
sudo dnf install x11-utils -y 
sudo dnf install sway -y 
sudo dnf install wofi -y 
sudo dnf install waybar -y 
sudo dnf install vim -y 
sudo dnf install vlc -y 
sudo dnf install wlogout -y 
sudo dnf install swaylock -y 
sudo dnf install swayidle -y 
sudo dnf install wget -y 
sudo dnf install curl -y 
sudo dnf install git -y 
sudo dnf install fd -y
