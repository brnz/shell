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

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/postgresql@13/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/node@16/bin:$PATH"

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
