# 1) change vim todo syntax highlighting
# 2) find what's causing source vimrc bugs
# 3) add timer to quotes completion
#
imports=( "stdlib" "apple_terminal" "aliases" "pretty" "shell" "utils" )

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit add-zsh-hook colors select-word-style
compinit -i
colors
# bash-style word functions
select-word-style bash
# enable shift-tab
bindkey "^[[Z" reverse-menu-complete

for script in $imports; do
    . "$HOME/.shell/scripts/$script"
done
