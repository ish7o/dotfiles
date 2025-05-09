md=$(playerctl metadata --format '
{{xesam:title}}
{{xesam:artist}}
{{xesam:album}}')

# md=$(playerctl metadata --format '{{mpris:artUrl}}
# {{xesam:title}}
# {{xesam:artist}}
# {{xesam:album}}')
# #
# url="$(echo "$md" | sed -n '1p' | sed 's|file://||')"
# if [ -z "$url" ]; then
#     url="/tmp/no-album-found.png"
# fi

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


# SYMLINK_PATH="/tmp/hyprlock-music"

# if [ -z "$title" ]; then
#     if [ -e "$SYMLINK_PATH" ]; then
#         rm $SYMLINK_PATH
#     fi
#     exit 0
# fi

# if [ -L "$SYMLINK_PATH" ]; then
#     exs=$(readlink "$SYMLINK_PATH")
#     if [ "$exs" != "$url" ]; then
#         ln -sf "$url" "$SYMLINK_PATH"
#     fi
# else
#     ln -s "$url"  "$SYMLINK_PATH"
# fi

c1="#6e6a86"
c2="#908caa"
echo -e "playing: <b>$title</b> on <span foreground='$c1'>$album</span> by <span foreground='$c2'><i>$artist</i></span> | <span>$timestamp / $total</span>"

