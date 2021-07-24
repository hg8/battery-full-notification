#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    if on_ac_power; then
        if [ "$battery_percent" -gt 98 ]; then
            notify-send -i "$PWD/batteryfull.png" "Battery full." "Level: ${battery_percent}% "
            vlc /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
        fi
    fi
    sleep 500 # (5 minutes)
done
