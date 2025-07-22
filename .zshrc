export LANG=en_US.UTF-8
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$(go env GOPATH)/bin:$PATH"
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
export INPUT_METHOD=fcitx5

# export THEME_BG="#231C1C"
# export THEME_TX="#F3D1D1"
# export THEME_AC="#FF8A8A"


# export NVIM_APPNAME=nvim-rewrite

alias btw="fastfetch"
alias py="python3"
alias ls='lsd'
alias vi='nvim'
alias vim='nvim'

# alias pickphotos='feh -d -n --scale-down --auto-zoom --action1 "cp ${f%.*}.NEF ~/personal/photos/shadow/"'

export EDITOR="nvim"

# alias discord="vesktop"

export POWERLINE_COMMAND=oh-my-posh

flashiso () {
    if [ $# -ne 2 ]; then
        echo "Want 2 arguments; got $# ($@)"
        echo "Example usage:"
        echo "flashiso ./nixos.iso /dev/sda"
        return 1
    fi

    echo "Writing iso ($1) to disk ($2)."
    read -p "Are you sure you want to overwrite dataon $2?" confirm
    case "$confirm" in
        [yY]) ;;
        *) echo "Aborted."; return 1 ;;
    esac

    sudo dd if="$1" of="$2" status=progress bs=4M oflag=sync && sync
}

hels () {
    [ $# -eq 0 ] && echo "Error: Expected an argument (or multiple). Got none." && return 1
    "$@" --help | less
}

crdir () {
    [ $# -eq 0 ] && echo "Specify a directory maybe?" && return 1
    [ -d "$1" ] && cd "$1" && return 0
    mkdir -p "$1" && cd "$1"
}

wttr () {
    if [ -z "$1" ]; then
        curl -s "wttr.in/?format=4"
        return 0
    fi
    curl -s "wttr.in/$1?format=4"
}

kill_port () {
    local selection pid port
    selection=$(lsof -iTCP -sTCP:LISTEN -Pn | awk 'NR>1 {print $9, $2, $1}' | fzf --prompt="Kill which port? ")

    [ -z "$selection" ] && return 1

    port=$(echo "$selection" | awk '{print $1}' | sed 's/.*://')
    pid=$(echo "$selection" | awk '{print $2}')

    echo "Killing PID $pid on port $port..."
    kill -9 "$pid"
}

shit () {
    sudo $(fc -ln 1)
}

rpi_status () {
    [[ $(ping -c 1 'raspberrypi.home.arpa' &>/dev/null; echo $?) -eq 0 ]] && echo "Raspberry Pi online." || "RPI DEAD"
}

bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

fastfetch

# echo "Next birthday: " $(bday | head -1)
eval "$(oh-my-posh init zsh --config ~/dotfiles/.config/oh-my-posh/config.toml)"

fpath=(~/.zsh.d/ $fpath)

[ -f "/home/ishto/.ghcup/env" ] && . "/home/ishto/.ghcup/env" # ghcup-env
