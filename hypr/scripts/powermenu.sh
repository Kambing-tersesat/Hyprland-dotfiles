#!/bin/bash

shutdown='󰐥 Shutdown'
reboot='󰜉 Restart'
lock=' Lock'
suspend='󰤄 A mimir'
logout='󰗼 Log Out' 


chosen=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -p  -theme ~/.config/rofi/powermenu.rasi)
case ${chosen} in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		swaylock -C ~/swaylock/themes/macchiato.conf
        ;;
    $suspend)
		systemctl suspend && gtklock 
        ;;
    $logout)
		hyprctl dispatch exit 0
        ;;
esac
