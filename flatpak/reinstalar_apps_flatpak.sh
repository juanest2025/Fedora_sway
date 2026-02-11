#!/bin/bash

xargs -a flatpak-apps.txt -r flatpak install -y flathub

