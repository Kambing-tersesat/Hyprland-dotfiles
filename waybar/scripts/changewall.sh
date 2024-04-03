#!/bin/bash

wallpapers=$(ls ~/Pictures/seele)

selected=$(echo -e $wallpapers | tr " " "\n" | rofi -dmenu)

if [$selected -eq ""]; then
    exit 0
fi

swww img ~/Pictures/seele/$selected --transition-fps 75 --transition-type any --transition-duration 3
wal -i ~/Pictures/seele/$selected
killall -SIGUSR2 waybar
cp ~/.cache/wal/colors-mako ~/.config/mako/
mv ~/.config/mako/colors-mako config
makoctl reload
