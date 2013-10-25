# Filename: .zshrc
# Maintainer: Abhishek Kapatkar

##############################################################################
# 01. General                                                                #
##############################################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git python)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/opt/local/bin

# AWS Setup
export PATH=$PATH:$HOME/AWS-ElasticBeanstalk-CLI-2.5.1/eb/macosx/python2.7/

# Z directory jumping util
. $HOME/dotfiles/z.sh

# Secret_key
SECRET_KEY="NU49gAHvAec0I6kp7Q3HZvpQY8nN4w2P"; export SECRET_KEY

# Setup rbenv
eval "$(rbenv init - zsh)"

# Setup pyenv
eval "$(pyenv init - zsh)"

##############################################################################
# 02. Aliases                                                                #
##############################################################################

#Productivity
alias path='echo -e ${PATH//:/\\n}'
alias ls="ls -Glah"

# work specific
alias work='/Users/akapatkar/financials && source .venv/bin/activate'

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# MySQL
alias start-mysql="sudo /Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop-mysql="sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

alias cl="clear"
alias sub='open -a "Sublime Text"'

alias gpusho="git push origin"
alias gpushom="git push origin master"
alias gpom="git pull origin master"
alias gpullo="git pull origin"

alias gd="git diff"
alias ga="git add ."
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

alias gcd='cd "`git rev-parse --show-toplevel`"'
alias grevall= "git checkout -- ."

# nice log summary from previous day for daily standup
alias gsup="clear && log --since '1 day ago' --oneline --author cabhishek@gmail.com"

alias log="git log --pretty=format:'%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]' --decorate --date=short"


