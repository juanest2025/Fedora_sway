#!/bin/bash

echo "== Agregando RPM Fusion =="

sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "== Limpiando caché =="

sudo dnf clean all

echo "== Actualizando repos =="

sudo dnf makecache

echo "== Repos instalados =="

sudo dnf repolist

echo "Listo."
