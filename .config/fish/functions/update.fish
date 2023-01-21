#
# Helper Functions
# http://apple.stackexchange.com/a/96810/7647
#
# Update Homebrew, npm, fisher, and their installed packages; get macOS Software
# Updates.
function update
	echo -e "\n-----------------\nUPDATING HOMEBREW\n-----------------\n";
	brew update && brew upgrade;
	echo -e "\n----------------\nHOMEBREW CLEANUP\n----------------\n";
	brew cleanup;

	echo -e "\n----------\nNPM UPDATE\n----------\n";
	npm-check -gu;

	echo -e "\n---------------------\nUPDATING FISH PLUGINS\n---------------------\n";
	fisher update;

	# Update Apple software last, since this can sometimes entail a restart.
	echo -e "\n-----------------------\nUPDATING APPLE SOFTWARE\n-----------------------\n";
	sudo softwareupdate -i -a;
end
