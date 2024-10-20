export LANG=en_GB.UTF-8

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

alias btw="fastfetch"
alias ls='lsd'
alias tree='lsd --tree'
alias vi='nvim'
alias vim='nvim'

export POWERLINE_COMMAND=oh-my-posh

fastfetch
eval "$(oh-my-posh init zsh --config ~/dotfiles/.config/oh-my-posh/config.toml)"

