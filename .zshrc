port TERM="xterm-256color"
export KEYTIMEOUT=1

bindkey -v
bindkey '^R' history-incremental-search-backward

export ZSH="/Users/mikemedina/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias reloadzsh="source ~/.zshrc"
alias vim=/usr/local/bin/vim

setopt nosharehistory
set -o vi

