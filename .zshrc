# Filename: .zshrc
# Maintainer: Abhishek Kapatkar


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# System info
export PLATFORM=$(uname -s)
export EDITOR=vim
export LANG=en_US.UTF-8

# CLI Colors
export CLICOLOR=1
# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
export GREP_OPTIONS="--color=auto";

# ZSH config
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git python)
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/opt/local/bin

# Append /usr/local/bin before /usr/bin
export PATH=/usr/local/bin:$PATH

# add .local to PATH
export PATH=~/.local/bin:$PATH

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh

#MYSQL
export PATH=$PATH:/usr/local/mysql/bin

# Golang
export GOPATH=$HOME/projects/go-play
export PATH=$PATH:$GOPATH/bin

# Z directory jumping util
. $HOME/dotfiles/z.sh

#pyenv path
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

# Setup rbenv
# eval "$(rbenv init - zsh)"
eval "$(rbenv init - --no-rehash)"

# Setup pyenv
eval "$(pyenv init - zsh)"

# Alias Hub
eval "$(hub alias -s)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Setup NVM
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
export NVM_DIR="~/.nvm"

# Load all helper .dot files
for file in ~/.{aliases,functions,work}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

export DOTFILES="$(dirname $(readlink $HOME/.zshrc))"

# Load all zsh files
for file in $DOTFILES/*/*.zsh; do
    source "$file"
done

# Load autocomplete and other zsh stuff
autoload -Uz compinit
compinit -i

# Reduce vim mode toggle delay
export KEYTIMEOUT=1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


