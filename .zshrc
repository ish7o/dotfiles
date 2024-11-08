export LANG=en_GB.UTF-8
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export INPUT_METHOD=fcitx5


alias btw="fastfetch"
alias ls='lsd'
alias tree='lsd --tree'
alias vi='nvim'
alias vim='nvim'

alias discord="vesktop"

export POWERLINE_COMMAND=oh-my-posh

fastfetch
eval "$(oh-my-posh init zsh --config ~/dotfiles/.config/oh-my-posh/config.toml)"

