#!/bin/bash

# Hyprctl üzerinden aktif klavye düzenini al
# jq ile ana klavyeyi seçip ismini çekiyoruz
LAYOUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

# İsimleri isteğine göre kısaltabilirsin (Opsiyonel)
case $LAYOUT in
"Turkish") LAYOUT="TR" ;;
"English (US)") LAYOUT="EN" ;;
"Russian") LAYOUT="RU" ;;
*) LAYOUT=$LAYOUT ;;
esac

# -r 9911: Mako'da eski bildirimin üzerine yazar, ekran dolmaz.
notify-send -u low -r 9911 -t 1500 "⌨ Layout" "Current: <b>$LAYOUT</b>"
