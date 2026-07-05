# bindkey -v
# autoload -Uz edit-command-line
# zle -N edit-command-line
#
# bindkey -M vicmd 'v' edit-command-line

source $HOME/.zsh_plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

alias v='nvim'

# Add dotfiles bin to PATH for switch-theme script
export PATH="$HOME/.dotfiles/bin:$PATH"

# Dynamically load theme environment variables before every prompt
autoload -Uz add-zsh-hook
_load_theme_env() {
  if [ -f "$HOME/.theme_env" ]; then
    source "$HOME/.theme_env"
  fi
}
add-zsh-hook precmd _load_theme_env
_load_theme_env # Also load it immediately on startup

# Load fzf (gracefully fallback if not installed)
# Since zsh-vi-mode overrides keybindings, we MUST load fzf after zsh-vi-mode initializes
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

source $HOME/.zshrc.local

# switch-theme auto-completion
if ! type compdef >/dev/null 2>&1; then
  autoload -Uz compinit
  compinit
fi
_switch_theme_completion() {
  local -a themes
  themes=($(ls ~/.dotfiles/themes/ 2>/dev/null))
  _describe 'themes' themes
}
compdef _switch_theme_completion switch-theme

# Initialize Starship prompt if installed
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
