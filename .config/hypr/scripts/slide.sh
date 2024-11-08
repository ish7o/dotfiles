file="$HOME/.local/share/slider.txt"
result=""
LENGTH=128

res=$(<$file)
result="${res:1:${#res}}${res:0:1}"
result="${result// /$'\u2007'}"

echo "$result" > $file
echo "${result:0:LENGTH}"


