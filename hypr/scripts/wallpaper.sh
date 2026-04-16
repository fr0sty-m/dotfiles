#!/bin/bash

DIR="$HOME/wallpapers"

set_wallpaper() {
  IMG=$(find "$DIR" -type f | shuf -n 1)

  # önce preload
  hyprctl hyprpaper preload "$IMG"

  # monitörlere uygula
  hyprctl monitors -j | jq -r '.[].name' | while read -r MON; do
    hyprctl hyprpaper wallpaper "$MON,$IMG"
  done

  # eski wallpaperları temizle (çok önemli)
  hyprctl hyprpaper unload unused
}

# hyprpaper hazır olana kadar bekle
sleep 1

set_wallpaper

while true; do
  sleep 300
  set_wallpaper
done
