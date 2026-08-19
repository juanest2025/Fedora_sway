#!/bin/bash

bash -c 'cat > /etc/NetworkManager/conf.d/wifi-powersave.conf <<EOF
[connection]
wifi.powersave = 2
EOF'

systemctl restart NetworkManager

