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

#reload settings
alias reload="source ~/.zshrc"

# cd to git root directory
alias cdr='cd "$(git root)"'

alias hi="history"
alias j="jobs"

alias sdown="sudo shutdown -h now"
alias rstart="sudo shutdown -r now"

alias rr="ranger"

#venv
alias mkvenv=mkvirtualenv
alias lsvenv=lsvirtualenv
alias rmvenv=rmvirtualenv
alias v2="source env/bin/activate"
alias v3="source env3/bin/activate"
alias v3-mypy="source env3-mypy/bin/activate"
alias v37="source env37/bin/activate"

# Mysql
alias start-mysql="mysql.server start"
alias stop-mysql="mysql.server stop"
alias mysql=/usr/local/Cellar/mysql/5.7.17/bin/mysql
alias mysqladmin=/usr/local/Cellar/mysql/5.7.17/bin/mysqladmin

# Productivity
alias path='echo -e ${PATH//:/\\n}'
alias ls="ls -Glah"
alias cls="clear"
alias tr="tree -CL 1 | less -FRNX"
alias tr2="tree -CL 2 | less -FRNX"
alias tr3="tree -CL 3 | less -FRNX"
alias tr4="tree -CL 4 | less -FRNX"
alias f=ag
alias s=fzf
alias t='date "+DATE: %Y-%m-%d%nTIME: %r"'

# Applications
alias vi=/Applications/MacVim.app/Contents/MacOS/vim
alias vim='open -a "/Applications/MacVim.app/Contents/MacOS/MacVim"'
alias vimapp='/Applications/MacVim.app/Contents/MacOS/Vim'
alias sub='open -a "Sublime Text"'

# More Git
alias gpusho="git push origin"
alias gpushom="git push origin master"
alias gpom="git pull origin master"
alias gpullo="git pull origin"
alias gpl="git pull --rebase"
alias gpc="git push origin \$(current_branch)"
alias gco="git checkout"
alias gd="git diff"
alias ga="git add --all"
alias gbd="git branch -D"
alias gst="git status"
alias gc="git commit -a"
alias gm="git merge --no-ff"
alias gpt="git push --tags"
alias grh="git reset --hard"
alias gcp="git cherry-pick"
alias grevall="git checkout -- ."
alias gcm="git commit --amend"
alias dmerged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias grv="git remote -v"
alias gra="git remote add"
alias stash="git stash"
alias gsm="git sprout master"
alias gfsync="git fetch upstream && git reset --hard upstream/master"
alias gs="git fetch upstream && git rebase upstream/master"

# Log summary from previous day commits
alias gsup="clear && log --since '1 day ago' --oneline --author cabhishek@gmail.com"

# Git logging
alias gl="git log --pretty='format:%Cgreen%h%C(blue) %an %C(reset) - %s %C(black)%C(bold)%cr' --graph"
alias log="git log --pretty=format:'%C(yellow)%h %C(blue)%ad%C(red)%d %C(reset)%s%C(green) [%cn]' --decorate --date=short"

# tmux
alias mkill="tmux kill-server"
alias mux="tmux new-session -s"
alias mat="tmux attach -t"
alias mls="tmux list-sessions"

# npm
alias 'npm install'='npm install --silent'

# SSH
alias dkdb="ssh abhi@science.datakind.org"
