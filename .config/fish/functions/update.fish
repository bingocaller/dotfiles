#
# Helper Functions
# http://apple.stackexchange.com/a/96810/7647
#
# Update Homebrew, npm, fisher, and their installed packages; get macOS Software
# Updates.
function update
	echo -e "╭───────────────────╮"
	echo -e "│ UPDATING HOMEBREW │"
	echo -e "╰───────────────────╯";
	brew update && brew upgrade;
	echo -e "╭──────────────────╮"
	echo -e "│ HOMEBREW CLEANUP │"
	echo -e "╰──────────────────╯";
	brew cleanup;

	echo -e "╭────────────╮"
	echo -e "│ NPM UPDATE │"
	echo -e "╰────────────╯";
	npm-check -gu;

	echo -e "╭───────────────────────╮"
	echo -e "│ UPDATING FISH PLUGINS │"
	echo -e "╰───────────────────────╯";
	fisher update;

	# Update Apple software last, since this can sometimes entail a restart.
	echo -e "╭─────────────────────────╮"
	echo -e "│ UPDATING APPLE SOFTWARE │"
	echo -e "╰─────────────────────────╯";
	sudo softwareupdate -i -a;
end
