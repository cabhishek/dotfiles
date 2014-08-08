# Filename: .zshrc
# Maintainer: Abhishek Kapatkar


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH config
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git python)
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/opt/local/bin

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh

# Aws Setup
export PATH=$PATH:$HOME/AWS-ElasticBeanstalk-CLI-2.6.0/eb/macosx/python2.7/

# App engine
GAE=/usr/local/google_appengine
export PATH=$PATH:$GAE

#MYSQL
export PATH=$PATH:/usr/local/mysql/bin

# Z directory jumping util
. $HOME/dotfiles/z.sh

# Secret_key
SECRET_KEY="NU49gAHvAec0I6kp7Q3HZvpQY8nN4w2P"; export SECRET_KEY

#pyenv path
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

# Setup rbenv
eval "$(rbenv init - zsh)"

# Setup pyenv
eval "$(pyenv init - zsh)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Load all helper .dot files
for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
