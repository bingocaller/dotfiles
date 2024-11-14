#
# Helper Functions
# http://apple.stackexchange.com/a/96810/7647
#
# Update fish plugins, Homebrew, Neovim, npm packages, and get macOS Software
# Updates.
function update
    # Store working directory so we can come back later (`cd -` may not always
    # work).
    set ORIGINAL_DIRECTORY (pwd)
    cd ~

    # Update Fish plugins first to avoid failures when Fish is upgraded as part
    # of `brew upgrade`
    echo -e "╭───────────────────────╮"
    echo -e "│ UPDATING FISH PLUGINS │"
    echo -e "╰───────────────────────╯"
    fisher update

    echo -e "╭───────────────────╮"
    echo -e "│ UPDATING HOMEBREW │"
    echo -e "╰───────────────────╯"
    brew update && brew upgrade
    echo -e "╭──────────────────╮"
    echo -e "│ HOMEBREW CLEANUP │"
    echo -e "╰──────────────────╯"
    brew cleanup

    # echo -e "╭─────────────────╮"
    # echo -e "│ UPDATING NEOVIM │"
    # echo -e "╰─────────────────╯"
    # NOTE: Installing/upgrading Neovim via Homebrew works as long as the latest
    # version of `utf8proc` is installed (`brew install utf8proc --HEAD`), so we
	# don’t need to install/upgrade it here.

    echo -e "╭────────────╮"
    echo -e "│ NPM UPDATE │"
    echo -e "╰────────────╯"
    npm-check -gu

    # Update Apple software last, since this can sometimes entail a restart.
    echo -e "╭─────────────────────────╮"
    echo -e "│ UPDATING APPLE SOFTWARE │"
    echo -e "╰─────────────────────────╯"
    sudo softwareupdate -i -a

    # Return to original directory
    cd $ORIGINAL_DIRECTORY
end
