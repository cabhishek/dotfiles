# Shortcuts
alias dot="cd ~/dotfiles"
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias dev="cd ~/dev"
alias h="cd ~"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd to git root directory
alias cdr='cd "$(git root)"'

alias hi="history"
alias j="jobs"

alias sdown="sudo shutdown -h now"
alias rstart="sudo shutdown -r now"

#venv
alias mkvenv=mkvirtualenv
alias lsvenv=lsvirtualenv
alias rmvenv=rmvirtualenv
alias venv="source env/bin/activate"

# Mysql
alias start-mysql="sudo /Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop-mysql="sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# Productivity
alias path='echo -e ${PATH//:/\\n}'
alias ls="ls -Glah"
alias cl="clear"
alias tr="tree -CL 1 | less -FRNX"
alias tr2="tree -CL 2 | less -FRNX"
alias tr3="tree -CL 3 | less -FRNX"
alias tr4="tree -CL 4 | less -FRNX"
alias f=ag
alias s=fzf
alias t='date "+DATE: %Y-%m-%d%nTIME: %r"'

# Applications
alias vim='open -a "/Applications/MacVim.app/Contents/MacOS/MacVim"'

alias sub='open -a "Sublime Text"'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

#Heroku
alias hpush="git push heroku"

#Hub
alias git=hub

# More Git
alias gpusho="git push origin"
alias gpushom="git push origin master"
alias gpom="git pull origin master"
alias gpullo="git pull origin"
alias gpl="git pull --rebase"
alias gco="git checkout"
alias gd="git diff"
alias ga="git add --all"
alias gbd="git branch -D"
alias gst="git status"
alias gc="git commit -a"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias grh="git reset --hard"
alias gb="git branch"
alias gcp="git cherry-pick"
alias grevall="git checkout -- ."
alias gcm="git commit --amend"
alias dmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Log summary from previous day commits
alias gsup="clear && log --since '1 day ago' --oneline --author cabhishek@gmail.com"

# Git logging
alias gl="git log --pretty='format:%Cgreen%h%C(blue) %an %C(reset) - %s %C(black)%C(bold)%cr' --graph"
alias log="git log --pretty=format:'%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]' --decorate --date=short"

alias hstart="/usr/local/Cellar/hadoop/2.7.1/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.1/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.7.1/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.1/sbin/stop-dfs.sh"
