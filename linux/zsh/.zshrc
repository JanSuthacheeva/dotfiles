HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -v

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit promptinit
compinit
promptinit
prompt fade white black white

eval "$(dircolors -b ~/.dircolors)"

alias ls='ls --color=auto -F'
