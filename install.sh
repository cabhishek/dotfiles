#!/bin/bash

# Filename: install
# Maintainer: Abhishek Kapatkar

echo ">>> Installing Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"	

echo ">>> Updating homebrew"
brew update

brew install \
	ag wget tree legit hub ctags \
	git imagemagick \
	pylint pyenv stormssh redis \
	sl tmux tree unrar wget zsh jq \
	the_silver_searcher git-extras

echo ">>> Installing bash fuzzy search"
brew reinstall --HEAD fzf
# Install shell extensions
/usr/local/Cellar/fzf/HEAD/install

echo ">>> Installing nvm"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash

# Setup dotfiles
./dotfiles.sh

