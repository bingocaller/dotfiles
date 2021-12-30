#!/usr/bin/env bash

# Install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh &&

# Install Homebrew packages
cd ./homebrew && brew bundle --force cleanup && cd - &&

# Install cargo stuff
cargo install stylua
