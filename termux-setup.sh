#!/bin/bash

# sources
source "$(dirname "$0")/setup-git.sh"

# update and install
pkg update -y
pkg install -y vim-python git openssh python

# set up config files
cp $PWD/.bashrc ~/
cp $PWD/.vimrc ~/
cp $PWD/config ~/.ssh/

# set up vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "extra-keys = [[ \\
	{key: 'ESC'},	\\
	{key: '/', popup: '~'},	\\
	{key: '-'},	\\
	{key: 'HOME'},	\\
	{key: 'UP'},	\\
	{key: 'END'}	\\
],[			\\
	{key: 'TAB'},	\\
	{key: 'CTRL'},	\\
	{key: 'ALT'},	\\
	{key: 'LEFT'},	\\
	{key: 'DOWN'},	\\
	{key: 'RIGHT'}	\\
]]" >> ~/.termux/termux.properties

# user input
setup-git-input

# set up
setup-git
