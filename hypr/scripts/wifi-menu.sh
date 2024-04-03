#!/bin/sh 
bssid=$(nmcli dev wifi list | sed -n '1!p' | cut -b 9- | rofi -dmenu| cut -d' ' -f1)
dmenu -p  -theme ~/.config/rofi/wifi-menu.rasi)

[ -z "$bssid" ] && exit

password=$(echo "" | rofi -dmenu )

wifi_network=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2 | sed 's/^[^:]*://')


[ -z "$password" ] && exit

# Notify the status
notify_connect() {
  status=$(echo $?)

  if [[ "$status" == '0' ]]; then
    dunstify -u low --replace=69 -i "$icon" "Connected to Network: $wifi_network"
  elif [[ "$status" -gt 0 ]]; then 
    dunstify -u low --replace=69 -i "$iconE" "Unable to Connect: Incorrect Passphrase"
  fi
}

# Connect to the Wifi & Display status 
nmcli device wifi connect $bssid password $password ; notify_connect





