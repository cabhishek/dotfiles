# Filename: .bashrc
# Maintainer: Abhishek Kapatkar

#General
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH

# CLI Colors
export CLICOLOR=1

# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
export GREP_OPTIONS="--color=auto";
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/cabhishek/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
