function install {
	echo ">>> Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"	
	brew update

	echo ">>> Installing wget"
	brew install wget

	echo ">> Installing Tree a subsitute for ls"
	brew install Tree

	echo ">> Installing bash fuzzy search"
	brew reinstall --HEAD fzf
	# Install shell extensions
	/usr/local/Cellar/fzf/HEAD/install

	echo ">>> Installing legit and hub for git"
	brew install legit && brew install hub

	echo ">>> Installing pyenv"
	brew install pyenv

	echo ">>> Installing nvm"
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash

	echo ">>> Installing storm for ssh management"
	brew install stormssh

	echo ">>> Installing silver searcher"
	brew install the_silver_searcher

	echo ">>> Installing git extras"
	brew install git-extras

	echo ">>> Installing exuberant ctags"
	brew install ctags

	echo ">>> Installing pylint"
	sudo pip install pylint
}

install
