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

# Aws Setup
export PATH=$PATH:$HOME/AWS-ElasticBeanstalk-CLI-2.5.1/eb/macosx/python2.7/

# Z directory jumping util
. $HOME/dotfiles/z.sh

# Secret_key
SECRET_KEY="NU49gAHvAec0I6kp7Q3HZvpQY8nN4w2P"; export SECRET_KEY

# Setup rbenv
eval "$(rbenv init - zsh)"

# Setup pyenv
eval "$(pyenv init - zsh)"

# Load all helper .dot files
for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done








