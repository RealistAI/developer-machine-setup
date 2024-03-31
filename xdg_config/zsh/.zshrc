# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in neovim with ctrl-e:
bindkey -v
export VISUAL=nvim
function edit-command-line-inplace() {
  if [[ $CONTEXT != start ]]; then
    if (( ! ${+widgets[edit-command-line]} )); then
      autoload -Uz edit-command-line
      zle -N edit-command-line
    fi
    zle edit-command-line
    return
  fi
  () {
    emulate -L zsh -o nomultibyte
    local editor=("${(@Q)${(z)${VISUAL:-${EDITOR:-vi}}}}") 
    case $editor in
      (*vim*)
        "${(@)editor}" -c "normal! $(($#LBUFFER + 1))go" -- $1
      ;;
      (*emacs*)
        local lines=("${(@f)LBUFFER}") 
        "${(@)editor}" +${#lines}:$((${#lines[-1]} + 1)) $1
      ;;
      (*)
        "${(@)editor}" $1
      ;;
    esac
    BUFFER=$(<$1)
    CURSOR=$#BUFFER
  } =(<<<"$BUFFER") </dev/tty
}
autoload edit-command-line-inplace; zle -N edit-command-line-inplace
bindkey '^e' edit-command-line-inplace

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
