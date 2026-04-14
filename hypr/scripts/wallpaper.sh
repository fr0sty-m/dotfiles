#!/bin/bash

DIR="/home/fr0sty/wallpapers"

set_wallpaper() {
  IMG=$(find "$DIR" -type f | shuf -n 1)

  hyprctl hyprpaper preload "$IMG"

  for MON in $(hyprctl monitors | grep "Monitor" | awk '{print $2}'); do
    hyprctl hyprpaper wallpaper "$MON,$IMG"
  done
}

# 🔥 ilk açılışta hemen uygula
sleep 2
set_wallpaper

# 🔁 sonra loop
while true; do
  sleep 300
  set_wallpaper
done
