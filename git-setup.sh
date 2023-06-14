#!/bin/bash

echo "# Running git setup"

setup_git_keygen() {
	ssh-keygen -f ~/.ssh/id_ed25519_github -t ed25519 -C "$(git config user.email)"
}

setup_git_input() {
	echo "Enter your name: "
	read -r NAME
	git config --global user.name "$NAME"
	echo "Enter your email: "
	read -r EMAIL
	git config --global user.email "$EMAIL"
	setup_git_keygen
}

setup_git_cssh() {
	SSH_KEY=$(cat ~/.ssh/id_ed25519_github.pub)
	copy_to_clipboard "$SSH_KEY"
}

setup_git_gpgkeygen() {
	gpg --full-generate-key
}

setup_git_cgpg() {
	GPG_KEY=$(gpg --list-secret-keys --keyid-format=long | grep sec | sed -r 's:^.*/([A-Z0-9]+) .*$:\1:')
	if [ -z "$GPG_KEY" ]
	then
		echo "No gpg key created"
		return
	fi
	git config --global user.signingkey $GPG_KEY
	git config --global commit.gpgsign true
	echo 'Copying GPG key to clipboard.'
	GPG_ARMOR=$(gpg --armor --export $GPG_KEY)
	copy_to_clipboard "$GPG_ARMOR"
}

copy_to_clipboard() {
	if [ -z "$1" ]; then
		return
	fi

	if command -v xclip &> /dev/null; then
		echo "$1" | xclip
	elif command -v pbcopy &> /dev/null; then
		echo "$1" | pbcopy
	elif command -v clip &> /dev/null; then
		echo "$1" | clip
	elif command -v termux-clipboard-set &> /dev/null; then
		echo "Using termux-clipboard-set"
		echo "$1" | termux-clipboard-set
	else
		echo 'Cannot find clipboard (xclip, pbcopy, clip, termux-clipboard-set)'
	fi
}

# Check if the function exists (bash specific)
if declare -f "setup_git_$1" > /dev/null; then
  # call arguments verbatim
  "setup_git_$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  exit 1
fi
