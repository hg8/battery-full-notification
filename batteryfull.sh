#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    echo "Battery percent: " $battery_percent"%"
    if on_ac_power; then
        if [ "$battery_percent" -gt 95 ]; then
            notify-send -i "$PWD/batteryfull.png" "Battery full." "Level: ${battery_percent}% "
            paplay /usr/share/sounds/linuxmint-gdm.wav
        fi
    else
        if [ "$battery_percent" -lt 15 ]; then
                notify-send -i "$PWD/batteryfull.png" "Battery low." "Level: ${battery_percent}% "
                paplay ./low_battery.wav
        fi
    fi
   

    sleep 5s
done
