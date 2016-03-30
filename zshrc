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

export PATH=$PATH:~/.vim/plugin

# add .local to PATH
export PATH=~/.local/bin:$PATH

export PATH=$PATH:/Users/cabhishek/miniconda3/bin

export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper.sh

#MYSQL
export PATH=$PATH:/usr/local/mysql/bin

# Golang
export GOPATH=$HOME/projects/go-play
export PATH=$PATH:$GOPATH/bin

# Nim-lang
export PATH=$PATH:~/dev/nim-0.13.0/bin

# Z directory jumping util
. $HOME/dotfiles/z.sh

#pyenv path
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

#JAVA
export JAVA_HOME=$(/usr/libexec/java_home)

# Setup rbenv
eval "$(rbenv init - --no-rehash)"

# Setup pyenv
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"

# Alias Hub
eval "$(hub alias -s)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export DOTFILES="$(dirname $(readlink $HOME/.zshrc))"

# Load all zsh files
for file in $DOTFILES/*/*.zsh; do
  source "$file"
done

[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -z "$TMPDIR" ] && TMPDIR=/tmp

export PATH="/usr/local/sbin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
