#!/bin/bash

# requerimientos primero

sudo dnf install git -y
sudo dnf install curl -y
sudo dnf install python3 -y
sudo dnf install ripgrep -y 
sudo dnf install fd -y 
# ahora el astrovim

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
# remover link .git del repo
rm -rf ~/.config/nvim/.git
nvim

