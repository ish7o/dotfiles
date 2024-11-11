#!/usr/bin/env bash

chosen=x"$@"
case "$chosen" in
    x'Shutdown') shutdown now ;;
    x'Reboot') reboot ;;
    x'Suspend') systemctl suspend ;;
    x'Lockscreen') hyprlock > /dev/null 2>&1 & exit 0 ;;
esac

if [ $chosen = x"" ]
then
    echo 'Shutdown'
    echo 'Reboot'
    echo 'Suspend'
    echo 'Lockscreen'
fi

