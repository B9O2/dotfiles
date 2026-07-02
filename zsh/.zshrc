bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -M vicmd 'v' edit-command-line

alias v='nvim'

source ~/.zshrc.local
