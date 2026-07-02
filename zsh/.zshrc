# bindkey -v
# autoload -Uz edit-command-line
# zle -N edit-command-line
#
# bindkey -M vicmd 'v' edit-command-line

source $HOME/.zsh_plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

alias v='nvim'

source $HOME/.zshrc.local
