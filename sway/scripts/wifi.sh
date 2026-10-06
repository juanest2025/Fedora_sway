#!/bin/bash

SSID="INTERYA_OMERO" 
PASSWORD="velez_984688"

# Apagar el Wi-Fi
echo "Apagando Wi-Fi..."
nmcli radio wifi off
sleep 3

# Encender el Wi-Fi
echo "Encendiendo Wi-Fi..."
nmcli radio wifi on
sleep 5

# Conectar a la red especificada
echo "Conectando a $SSID..."
nmcli device wifi connect "$SSID" password "$PASSWORD"

if [ $? -eq 0 ]; then
    echo "✅ Conectado correctamente a $SSID"
else
    echo "❌ Error al conectar a $SSID"
fi

