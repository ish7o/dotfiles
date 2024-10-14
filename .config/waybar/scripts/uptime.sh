#!/bin/bash

uptime_seconds=$(awk '{print int($1)}' /proc/uptime)

days=$(( uptime_seconds / 86400 ))
hours=$(( (uptime_seconds % 86400) / 3600 ))
minutes=$(( (uptime_seconds % 3600) / 60 ))
seconds=$(( uptime_seconds % 60 ))

sep="─┴─"
# echo "{\"text\": \"UwU ~ System Uptime: ${days}d:${hours}h:${minutes}m:${seconds}s\", \"tooltip\": \"The system has been up for ${days} days, ${hours} hours, ${minutes} minutes, and ${seconds} seconds!\", \"class\": \"uptime\"}"
# echo "${days}d ${hours}h ${minutes}m ${seconds}s"
if (( days > 0 )); then
    uptime_str="[${days}d]${sep}[${hours}h]${sep}[${minutes}m]${sep}[${seconds}s]"
elif (( hours > 0 )); then
    uptime_str="[${hours}h]${sep}[${minutes}m]${sep}[${seconds}s]"
elif (( minutes > 0 )); then
    uptime_str="[${minutes}m]${sep}[${seconds}s]"
else
    uptime_str="[${seconds}s]"
fi
echo "└─${uptime_str}─┘"




