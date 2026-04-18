#!/bin/bash

# Klasörleri bul ve Rofi ile seç
SELECTION=$(fd . $HOME --type d --hidden --exclude .git | rofi -dmenu -i -p "Klasöre Git:")

# Seçim yapıldıysa Dolphin ile o klasörü aç
if [ -n "$SELECTION" ]; then
  dolphin "$SELECTION"
fi
