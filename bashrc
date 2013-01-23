# Filename: .bashrc
# Maintainer: Abhishek Kapatkar

##############################################################################
# 01. General                                                                #
##############################################################################
export PATH=$HOME/local/bin:$PATH
#export PATH=$HOME/local/bin:$PATH .~/.bashrc
. /Users/cabhishek/z.sh

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output
alias ls="ls -Glah"
alias slime='open -a "Sublime Text 2"'
alias gpushom="git push origin master"
alias gd="git diff | mate"
alias ga="git add"
alias gbd="git branch -D"
alias gst="git status"
alias gca="git commit -a -m"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias gp="git push"
alias grh="git reset --hard"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias gcp="git cherry-pick"
alias gl="git log --pretty='format:%Cgreen%h%Creset %an - %s' --graph"
alias gpom="git pull origin master"
alias gcd='cd "`git rev-parse --show-toplevel`"'

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################
# CLI Colors
export CLICOLOR=1
# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
