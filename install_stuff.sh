#!/usr/bin/env bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Reload shell to ensure `brew` is available
exec bash
# Check if brew is availabe (i.e. if `which` returns exit code 0)
which brew;
if [[ $? == 0 ]]; then
	# Install Homebrew packages
	cd ./homebrew && brew bundle --force && cd -
else
	echo '`brew` is not in $PATH'
fi
