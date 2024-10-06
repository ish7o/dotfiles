# !/bin/zsh
DISK_INFO=$(df -h / | awk 'NR==2 {print $3 " used, " $4 " available"}')
echo "{\"text\": \"Disk: $DISK_INFO\"}"

