#!/bin/bash

wallpapers=$(ls ~/wallpapers/)

selected=$(echo -e $wallpapers | tr " " "\n" | rofi -dmenu)

if [$selected -eq ""]; then
    exit 0
fi

swww img ~/wallpapers/$selected --transition-fps 60 --transition-type any --transition-duration 2
wal -i ~/wallpapers/$selected
killall -SIGUSR2 waybar
cp ~/.cache/wal/colors-mako ~/.config/mako/
mv ~/.config/mako/colors-mako config
makoctl reload
