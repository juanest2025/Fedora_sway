#!/bin/bash

sudo bash -c 'cat > /etc/NetworkManager/conf.d/wifi-powersave.conf <<EOF
[connection]
wifi.powersave = 2
EOF'

sudo systemctl restart NetworkManager

