#!/bin/bash

PACKAGES="vim-python git openssh python man"
ADDITONAL_PACKAGES="gnupg ctags"

echo "# Running package install"

if command -v termux-info &> /dev/null
then
	echo "Termux detected running pkg install"
	. "$(dirname $0)/termux-setup.sh"
fi

echo "# Copy config files to ~"
cp $PWD/dotfiles/* ~/

#echo "# Set up vim plug plugins"
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +qall

# set up git keys
bash "$(dirname "$0")/git-setup.sh" input
bash "$(dirname "$0")/git-setup.sh" gpgkeygen
bash "$(dirname "$0")/git-setup.sh" gpg

