#!/bin/bash
nmcli device wifi rescan 2>/dev/null
ssid=$(nmcli -t -f SIGNAL,SECURITY,SSID device wifi list |
	sort -t: -k1 -nr |
	awk -F: '$3!=""{printf "%s%% %s %s\n",$1,($2==""?"abierta":"🔒"),$3}' |
	fuzzel --dmenu -p "Wifi: " | cut -d' ' -f3-)
[ -z "$ssid" ] && exit
nmcli connection up "$ssid" 2>/dev/null || {
	pass=$(fuzzel --dmenu --password -p "Contraseña: " </dev/null)
	nmcli device wifi connect "$ssid" password "$pass"
}
