# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1


# PATH
export PATH=$PATH:/opt/hombrew/bin

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# activate zsh-syntax-highlighting zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey ';' autosuggest-accept
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_DEFAULT_COMMAND='rg --hidden -l ""' # Include hidden files

bindkey "ç" fzf-cd-widget # Fix for ALT+C on Mac

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Custom function
# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Tmux
# Always work in a tmux session if Tmux is installed
# if which tmux >/dev/null 2>&1; then
#   # Check if the current environment is suitable for tmux
#   if [[ -z "$TMUX" && \
#         $TERM != "screen-256color" && \
#         $TERM != "screen" && \
#         -z "$VSCODE_INJECTION" && \
#         -z "$INSIDE_EMACS" && \
#         -z "$EMACS" && \
#         -z "$VIM" && \
#         -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
#     # Try to attach to the default tmux session, or create a new one if it doesn't exist
#     tmux attach -t default >/dev/null 2>&1 || tmux new -s default
#     exit
#   fi
# fi


# zoxide - a better cd command
eval "$(zoxide init zsh)"


# Themes
export TMUX_THEME="onedark"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"



# Vi mode
# ANSI cursor escape codes:
# \e[0 q: Reset to the default cursor style.
# \e[1 q: Blinking block cursor.
# \e[2 q: Steady block cursor (non-blinking).
# \e[3 q: Blinking underline cursor.
# \e[4 q: Steady underline cursor (non-blinking).
# \e[5 q: Blinking bar cursor.
# \e[6 q: Steady bar cursor (non-blinking).
bindkey -v
export KEYTIMEOUT=1 # Makes switching modes quicker
export VI_MODE_SET_CURSOR=true 

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q' # block
  else
    echo -ne '\e[6 q' # beam
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate 'vi insert' as keymap (can be removed if 'binkey -V has been set elsewhere')
  echo -ne '\e[6 q'
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup

# Yank to the system clipboard
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

