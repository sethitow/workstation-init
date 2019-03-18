#! /usr/bin/env bash


# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


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

# Make fish default shell
brew install fish
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/fish


# Banish .DS_Store files from git tracking
echo .DS_Store > ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
