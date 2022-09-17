#!/bin/bash

# sources
# source "$(dirname "$0")/setup-git.sh"

# update and install
pkg update -y
pkg install -y vim-python git openssh python man 
pkg install -y gnupg ctags

# termux keyboard
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
