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


    # Installing/upgrading Neovim via Homebrew works as long as the latest
    # version of `utf8proc` is installed (`brew install utf8proc --HEAD`).

    # echo -e "╭─────────────────╮"
    # echo -e "│ UPDATING NEOVIM │"
    # echo -e "╰─────────────────╯"

    # -- This also doesn’t work. Somehow it creates references to Lua files in
    # -- `/Users/runner` instead of `/Users/bingocaller`.
    # cd ~/Downloads
    # curl --location --remote-name https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz
    # xattr -c ./nvim-macos-x86_64.tar.gz
    # tar xzvf nvim-macos-x86_64.tar.gz
    # cp nvim-macos-x86_64/bin/nvim /usr/local/bin/nvim
    # cp -r nvim-macos-x86_64/lib/nvim /usr/local/lib/nvim
    # cp -r nvim-macos-x86_64/share/nvim /usr/local/share/nvim

    # -- Previous method: build from source. No longer used.
    # cd ~/dev/neovim
    # git pull
    # make clean distclean
    # make CMAKE_BUILD_TYPE=RelWithDebInfo
    # sudo make install
    # cd ~

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
