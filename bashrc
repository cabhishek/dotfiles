# Filename: .bashrc
# Maintainer: Abhishek Kapatkar

##############################################################################
# 01. General                                                                #
##############################################################################
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH
#export PATH=$HOME/local/bin:$PATH .~/.bashrc
alias ls="ls -Glah"

##############################################################################
# 02. Theme/Colors                                                           #
##############################################################################
# CLI Colors
export CLICOLOR=1
# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
