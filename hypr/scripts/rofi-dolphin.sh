#!/bin/bash

# Klasörleri bul ve Rofi ile seç
SELECTION=$(fd . $HOME --type d --hidden --exclude .git | rofi -dmenu -show-icons -matching fuzzy -i -p "Directory:")

# Seçim yapıldıysa Dolphin ile o klasörü aç
if [ -n "$SELECTION" ]; then
  thunar "$SELECTION"
fi
