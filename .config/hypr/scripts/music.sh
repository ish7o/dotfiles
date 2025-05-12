md=$(playerctl metadata --format '
{{xesam:title}}
{{xesam:artist}}
{{xesam:album}}')

title="$(echo "$md" | sed -n '2p')"
artist="$(echo "$md" | sed -n '3p')"
album="$(echo "$md" | sed -n '4p')"

passed="$(playerctl position | cut -d. -f1)"
seconds=$((passed / 60))
minutes=$((passed % 60))
timestamp=$(printf "%02d:%02d" "$seconds" "$minutes")

total="$(playerctl metadata --format '{{mpris:length}}' | cut -d. -f1)"
s=$((total / 1000000 / 60))
m=$((total / 1000000 % 60))
total=$(printf "%02d:%02d" $s $m)


c1="#6e6a86"
c2="#908caa"
echo -e "playing: <b>$title</b> on <span foreground='$c1'>$album</span> by <span foreground='$c2'><i>$artist</i></span> | <span>$timestamp / $total</span>"

