#! /usr/bin/env bash

# Symlink profile
ln --symbolic --force "$(pwd)/.profile" $HOME/.profile
ln --symbolic --force "$(pwd)/.zprofile" $HOME/.zprofile

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Install backages
	apt-get update && \
    apt-get install -y zsh \
                       vim \
                       vim-python-jedi \
                       curl \
                       wget \
                       build-essential \
                       software-properties-common \
                       git \
                       tree \
                       mosh \
                       openssh-server \
                       python3 \
                       python3-pip \
                       ranger \
                       htop

    # Set zsh as default shell
	chsh --shell /usr/bin/zsh

elif [[ "$OSTYPE" == "darwin"* ]]; then
	# Enable sudo TouchID
	sed -i '' '2i\
	auth       sufficient     pam_tid.so\
	' /etc/pam.d/sudo

	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Banish .DS_Store files from git tracking
	echo .DS_Store > ~/.gitignore_global
	git config --global core.excludesfile ~/.gitignore_global

	# Install Homebrew packages
	brew install git tree wget vim pyenv ffmpeg nmap socat bandwhich ranger
fi


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure vim
ln -s "$(pwd)/.vimrc" $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Configure git
git config --global rebase.instructionFormat "(%an <%ae>) %s"
