#!/usr/bin/env bash

# Set fish as default shell
which fish;
if [[ $? == 0 ]]; then
	sudo echo "$(which fish)" >> /etc/shells
	chsh -s "$(whoami) $(which fish)"
else
	echo '`fish` is not in $PATH'
fi
