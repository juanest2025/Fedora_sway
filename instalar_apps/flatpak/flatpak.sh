#!/bin/bash

flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo 

xargs -a flatpak-apps.txt -r flatpak install -y flathub


