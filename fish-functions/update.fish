#
# Helper Functions
# http://apple.stackexchange.com/a/96810/7647
#
function update
    # Get macOS Software Updates; update Homebrew, npm, fisher, and their installed packages
    echo -e "\n-----------------------\nUPDATING APPLE SOFTWARE\n-----------------------\n"; sudo softwareupdate -i -a &&
    echo -e "\n-----------------\nUPDATING HOMEBREW\n-----------------\n"; brew update && brew upgrade &&
    echo -e "\n------------\nBREW CLEANUP\n------------\n"; brew cleanup &&
    echo -e "\n----------\nNPM UPDATE\n----------\n"; npm install npm -g && npm update -g &&
    echo -e "\n---------------------\nUPDATING FISH PLUGINS\n---------------------\n"; fisher update
end
