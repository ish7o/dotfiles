file="$HOME/.local/share/slider.txt"
result=""
LENGTH=48

res=$(<$file)
# result="${res:1:${#res}}${res:0:1}"
result=$(cat $file | tail $(wc -l $file))

echo "$result" > $file
echo "${result:0:LENGTH}"


