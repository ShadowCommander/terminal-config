#!/bin/bash

PACKAGES="vim-python git openssh python man"
ADDITONAL_PACKAGES="gnupg ctags"

if command -v termux-info &> /dev/null
then
	source "$(dirname "$0")/termux-setup.sh"
fi

# set up config files
cp $PWD/.bashrc ~/
cp $PWD/.vimrc ~/
cp $PWD/config ~/.ssh/

# set up vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# sources
# source "$(dirname "$0")/setup-git.sh"

