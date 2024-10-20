#!/bin/bash

# Function to print the header with a border
# print_header() {
#     echo "┌───────────────────────────────────────"
#     echo "│        System Statistics          "
#     echo "├───────────────────────────────────────"
# }

print_stat() {
    local stat_name="$1"
    local stat_value="$2"
    printf "├ %-24s %s\n" "$stat_name:" "$stat_value"
}

UPTIME=$(uptime -p)
print_stat "Uptime" "$UPTIME"

KERNEL_VERSION=$(uname -r)
print_stat "Kernel Version" "$KERNEL_VERSION"

TOTAL_MEMORY=$(free -h | grep Mem | awk '{print $2}')
print_stat "Total Memory" "$TOTAL_MEMORY"

USED_MEMORY=$(free -h | grep Mem | awk '{print $3}')
print_stat "Used Memory" "$USED_MEMORY"

DISK_USAGE=$(df -h --output=pcent / | tail -n 1)
print_stat "Disk Usage" "$DISK_USAGE"

CPU_LOAD=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
print_stat "CPU Load" "$CPU_LOAD"

NUM_PROCESSES=$(ps aux | wc -l)
print_stat "Number of Processes" "$NUM_PROCESSES"

CPU_TEMP=$(sensors | grep 'Package id 0:' | awk '{print $4}' 2>/dev/null)
print_stat "CPU Temperature" "${CPU_TEMP:-"N/A"}"

GPU_USAGE=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader 2>/dev/null)
print_stat "GPU Usage" "${GPU_USAGE:-"N/A"}"

NETWORK_TRAFFIC=$(ip -s link | grep -E '^[0-9]+: ' | head -n 1 | awk '{print $2}' 2>/dev/null)
print_stat "Network Traffic" "${NETWORK_TRAFFIC:-"N/A"}"

IP_ADDRESS=$(ip addr show | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1 | head -n 1 2>/dev/null)
print_stat "IP Address" "${IP_ADDRESS:-"N/A"}"

SWAP_USAGE=$(free -h | grep Swap | awk '{print $2, $3}' 2>/dev/null)
print_stat "Swap Usage" "${SWAP_USAGE:-"N/A"}"

BATTERY_PERCENTAGE=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' 2>/dev/null)
print_stat "Battery Percentage" "${BATTERY_PERCENTAGE:-"N/A"}"

FILE_SYSTEM_TYPE=$(lsblk -f | awk '$NF == "/" {print $2}' 2>/dev/null)
print_stat "File System Type" "${FILE_SYSTEM_TYPE:-"N/A"}"

CURRENT_TIME=$(date +%T)
print_stat "Current Time" "$CURRENT_TIME"

KERNEL_NAME=$(uname -s)
print_stat "Kernel Name" "$KERNEL_NAME"

ACTIVE_SERVICES=$(systemctl list-units --type=service --state=running | wc -l)
print_stat "Active Services" "$ACTIVE_SERVICES"

TOTAL_DISK_SPACE=$(df -h / | grep / | awk '{print $2}' 2>/dev/null)
print_stat "Total Disk Space" "${TOTAL_DISK_SPACE:-"N/A"}"

FREE_DISK_SPACE=$(df -h / | grep / | awk '{print $4}' 2>/dev/null)
print_stat "Free Disk Space" "${FREE_DISK_SPACE:-"N/A"}"

SYSTEM_ARCHITECTURE=$(uname -m)
print_stat "System Architecture" "$SYSTEM_ARCHITECTURE"

# echo "└───────────────────────────────────────"

