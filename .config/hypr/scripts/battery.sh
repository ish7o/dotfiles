#!/bin/bash

battery_path="/sys/class/power_supply/BAT0"

battery_level=$(cat "$battery_path/capacity")
battery_status=$(cat "$battery_path/status")

echo -e "battery: <span foreground='#4c764c'>$battery_level%</span> (<span foreground='#6e6a86'>$battery_status</span>)"
