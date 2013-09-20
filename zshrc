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

#AWS crap
export PATH=$PATH:$HOME/Projects/AWS-ElasticBeanstalk-CLI-2.3/eb/macosx/python2.7/

# Z directory jumping util
. $HOME/dotfiles/z.sh

#VIRTUALENVWRAPPER_PYTHON
export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/2.7/bin/python

#secret_key
SECRET_KEY="NU49gAHvAec0I6kp7Q3HZvpQY8nN4w2P"; export SECRET_KEY

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

##############################################################################
# 02. Aliases                                                                #
##############################################################################
eval "$(rbenv init -)"
eval "$(hub alias -s)"

# Enable colors in "ls" command output
alias cl="clear"
alias slime='open -a "Sublime Text"'
alias gpusho="git push origin"
alias gpushom="git push origin master"
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
alias gpom="git pull origin master"
alias gpullo="git pull origin"
alias gcd='cd "`git rev-parse --show-toplevel`"'
alias grevall= "git checkout -- ."
# nice log summary from previous day for daily standup
alias gsup="clear && log --since '1 day ago' --oneline --author cabhishek@gmail.com"
alias log="git log --pretty=format:'%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]' --decorate --date=short"
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
