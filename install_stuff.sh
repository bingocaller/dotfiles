#!/usr/bin/env bash

# Install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Install Homebrew packages
cd ./homebrew && brew bundle --force cleanup && cd -

# Set fish as default shell
# From `login`’s manpage:
#
# -f	When a user name is specified, this option indicates that proper
#		authentication has already been done and that no password need be
#		requested.
#		This option may only be used by the super-user or when an already logged
#		in user is logging in as themselves.
#
#		With the -f option, an alternate program (and any arguments) may be run
#		instead of the user's default shell.  The program and arguments follows
#		the user name.
#
# -l	Tells the program executed by login that this is not a login session (by
#		convention, a login session is signalled to the program with a hyphen as
#		the first character of argv[0]; this option disables that), and prevents
#		it from chdir(2)ing to the user's home directory.  The default is to add
#		the hyphen (this is a login session).
#
# -p	By default, login discards any previous environment.  The -p option
#		disables this behavior.
#
# -q	This forces quiet logins, as if a .hushlogin is present.
chsh -s 'login -fpql $(whoami) $(which fish)'

# Install cargo stuff
cargo install stylua
