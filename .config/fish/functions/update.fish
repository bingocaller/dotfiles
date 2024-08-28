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

    echo -e "╭─────────────────╮"
    echo -e "│ UPDATING NEOVIM │"
    echo -e "╰─────────────────╯"
    cd ~/dev/neovim
    git pull
    make clean distclean
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd ~

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
