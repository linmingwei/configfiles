# aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# PATH
export PATH=$PATH:/opt/hombrew/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# activate zsh-syntax-highlighting zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bindkey
# enable vim mode
bindkey -v
# --- 添加下面这行来修复退格键 ---
bindkey '^?' backward-delete-char
bindkey ';' autosuggest-accept


zle-keymap-select () {
  case $KEYMAP in
    vicmd)      echo -ne '\e[2 q' ;;
    viins|main) echo -ne '\e[6 q' ;;
  esac
}
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    echo -ne "\e[6 q"
}
zle -N zle-line-init

export TMUX_THEME="onedark"
# export TMUX_THEME="nord"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

