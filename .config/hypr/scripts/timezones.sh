#!/bin/bash

declare -A timezones=(
    ["Pacific Time"]="America/Los_Angeles"
    ["Mountain Time"]="America/Denver"
    ["Central Time"]="America/Chicago"
    ["Eastern Time"]="America/New_York"
    ["Greenwich Mean Time"]="GMT"
    ["Central European Time"]="Europe/Berlin"
    ["India Standard Time"]="Asia/Kolkata"
    ["China Standard Time"]="Asia/Shanghai"
    ["Japan Standard Time"]="Asia/Tokyo"
    ["Australian Eastern Time"]="Australia/Sydney" 
)

# printf "%1*d\n" 25
# echo "┌────╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌────┐"
for city in "${!timezones[@]}"; do
    timezone=${timezones[$city]}
    current_time=$(TZ="$timezone" date +"%Y-%m-%d %H:%M:%S")
    printf "%-24s %s ┤\n" "$city:" "$current_time"
done
# echo "└────────────────────────┴─────────────────────┘"

