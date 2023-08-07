#!/bin/bash

ip_file="/ruta/a/la/carpeta/ip.tmp"

if [ "$1" = "click-left" ]; then
    new_ip=$(rofi -dmenu -p "Ingresa la IP:" <<< "$(cat "$ip_file")")
    if [ "$new_ip" = "No target" ]; then
        echo "No target" > "$ip_file"
    elif [ -n "$new_ip" ]; then
        echo "$new_ip" > "$ip_file"
    fi

    polybar-msg hook  nombre_modulo 1
fi

ip=$(cat "$ip_file")

if [ "$ip" = "No target" ]; then
    echo -n "%{F#FF0000}󱚡 %{u-} No target" 
else
    echo -n "$ip" | xclip -sel clip
    echo -n "%{F#00FF00}󱚝  %{F#ffffff}$ip" 

fi




