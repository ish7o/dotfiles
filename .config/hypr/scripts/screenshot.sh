#!/bin/bash

ext="png"
FILE_NAME="screenshot-$(date +%F-%T).$ext"
FILE_PATH="${HOME}/screenshots/${FILE_NAME}"
mode="$1"

geometry=""
if [ mode = "region" ]; then
    geometry="-g $(slurp)"
fi

hyprshade off
grim -t $ext $geometry "$FILE_PATH"
hyprshade auto
notify-send 'Screenshot' -i "$FILE_PATH" "$FILE_NAME"
