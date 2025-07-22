#!/bin/env bash

if mpc status | grep -q playing; then
    md=$(mpc status -f "%title%\n%artist%\n%album%")

    time=$(mpc status | grep -oE '[0-9]+:[0-9]+/[0-9]+:[0-9]+')
    currenttime=$(echo "$time" | cut -d/ -f1)
    totaltime=$(echo "$time" | cut -d/ -f2)
elif playerctl metadata >/dev/null 2>&1; then
    md=$(playerctl metadata --format '{{xesam:title}}\n{{xesam:artist}}\n{{xesam:album}}')

    passed="$(playerctl position | cut -d. -f1)"
    currenttime=$(printf "%02d:%02d" "$((passed / 60))" "$((passed % 60))")
    total="$(playerctl metadata --format '{{mpris:length}}' | cut -d. -f1)"
    totaltime=$(printf "%02d:%02d" $((total / 60000000)) $((total % 60000000)))
else
    exit 0
fi

title="$(echo "$md" | sed -n '1p')"
artist="$(echo "$md" | sed -n '2p')"
album="$(echo "$md" | sed -n '3p')"

[[ -z "$title" ]] && return 0


c1="#6e6a86"
c2="#908caa"
echo -e "playing: <b>$title</b> on <span foreground='$c1'>$album</span> by <span foreground='$c2'><i>$artist</i></span> | <span>$currenttime / $totaltime</span>"

