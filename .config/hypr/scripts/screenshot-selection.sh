#!/bin/bash

ext="png"
FILE_NAME="screenshot-$(date +%F-%T).$ext"
FILE_PATH="${HOME}/screenshots/${FILE_NAME}"
hyprshade off
grim -t $ext -g "$(slurp)" "${FILE_PATH}"
hyprshade auto
notify-send 'Screenshot' -i "${FILE_PATH}" "${FILE_NAME}"
