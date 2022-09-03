
#!/bin/sh

setup_git_input() {
	echo "Enter your name: "
	read -r NAME
	git config --global user.name "$NAME"
	echo "Enter your email: "
	read -r EMAIL
	git config --global user.email "$EMAIL"
	ssh-keygen -f ~/.ssh/id_ed25519_github -t ed25519 -C "$(git config user.email)"
}

setup_git_gpg() {
	GPG_KEY=$(gpg --list-secret-keys --keyid-format=long | grep sec | sed -r 's:^.*/([A-Z0-9]+) .*$:\1:')
	git config --global user.signingkey $GPG_KEY
	git config --global commit.gpgsign true
}

# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  exit 1
fi
