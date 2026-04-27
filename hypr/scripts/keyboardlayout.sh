#!/bin/bash

LAYOUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

case $LAYOUT in
"Turkish") LAYOUT="TR" ;;
"English (US)") LAYOUT="EN" ;;
"Russian") LAYOUT="RU" ;;
*) LAYOUT=$LAYOUT ;;
esac

notify-send -u low -r 9911 -t 1500 "⌨ Layout" "Current: <b>$LAYOUT</b>"
