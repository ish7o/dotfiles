#!/bin/bash

disk_usage=$(df -h --output=used,avail,pcent / | tail -n 1)
used=$(echo $disk_usage | awk '{print $1}')
available=$(echo $disk_usage | awk '{print $2}')
percent_used=$(echo $disk_usage | awk '{print $3}' | sed 's/%//')

# echo "{\"text\": \"Disk Space: [${used} used] [${available} available]\", \"tooltip\": \"Disk Usage: ${used} used, ${available} available\", \"class\": \"diskspace\"}"

sep="─┴─"

# DISK_INFO=$(df -h / | awk 'NR==2 {print $3 " used, " $4 " available"}')
# echo "{\"text\": \"Disk: $DISK_INFO\"}"
echo "└─[${used}]${sep}[${percent_used}%]─┘"


