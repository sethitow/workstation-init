#! /usr/bin/env bash

# Enable sudo TouchID
sed -i '' '2i\
auth       sufficient     pam_tid.so\
' /etc/pam.d/sudo

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install vim
brew install vim
cp ./.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# Install Python 3
brew install python3
pip install pipenv


# Add user bin to path
echo "~/bin" >> /etc/paths


# Banish .DS_Store files from git tracking
echo .DS_Store > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
