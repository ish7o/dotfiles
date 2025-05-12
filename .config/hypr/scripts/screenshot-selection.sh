#!/bin/bash

FILE_NAME="screenshot-$(date +%F-%T).png"
FILE_PATH="${HOME}/screenshots/${FILE_NAME}"
hyprshade off
grim -t png -g "$(slurp)" "${FILE_PATH}"
hyprshade auto
notify-send 'Screenshot' -i "${FILE_PATH}" "${FILE_NAME}"
