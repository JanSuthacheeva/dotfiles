# ~/.zshrc — pure zsh (no oh-my-zsh, no powerlevel10k).
# Prompt is a custom single-line aurum prompt (see PROMPT below).

##--------------------------------------------------------------------------
## PATH & environment
##--------------------------------------------------------------------------
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin/python3:$PATH"

export CC="/usr/bin/gcc"
export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
export XDG_CONFIG_HOME="$HOME/.config"
export CAVEMAN_DEFAULT_MODE=ultra

##--------------------------------------------------------------------------
## History
##--------------------------------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extended_glob nomatch
setopt hist_ignore_dups hist_reduce_blanks share_history
unsetopt beep

##--------------------------------------------------------------------------
## Completion & keymap
##--------------------------------------------------------------------------
bindkey -v
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''

##--------------------------------------------------------------------------
## Prompt (aurum): path + git branch/dirty + chevron
##--------------------------------------------------------------------------
# Colors: steel #849ec2 (path), pastel gold #ecd693 (branch/ok chevron),
# terracotta #cf6a48 (dirty markers, error chevron).
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{#cf6a48}*'
zstyle ':vcs_info:git:*' stagedstr '%F{#cf6a48}+'
zstyle ':vcs_info:git:*' formats ' %F{#ecd693}%b%u%c%f'
zstyle ':vcs_info:git:*' actionformats ' %F{#ecd693}%b|%a%u%c%f'
precmd() { vcs_info }
setopt prompt_subst
PROMPT='%F{#849ec2}%~%f${vcs_info_msg_0_} %(?.%F{#ecd693}.%F{#cf6a48})❯%f '

##--------------------------------------------------------------------------
## nvm
##--------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

##--------------------------------------------------------------------------
## Aliases
##--------------------------------------------------------------------------
alias ls='ls -F'
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias glg='git log --oneline --decorate --graph'
alias pa="php artisan"
alias sail="sh $([ -f sail ] && echo sail || echo vendor/bin/sail)"
alias sa="sail artisan"
alias python="python3"
