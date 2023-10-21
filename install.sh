#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Installing dotfiles from: $SCRIPT_DIR"

# Check if the files exist and rename them if they do
if [ -e ~/.bash_profile ]; then
    if [ ! -e ~/.bash_profile.bak ]; then
        mv ~/.bash_profile ~/.bash_profile.bak
        echo "Renamed .bash_profile to .bash_profile.bak"
    fi
    rm -rf ~/.gitconfig
fi

if [ -e ~/.inputrc ]; then
    if [ ! -e ~/.inputrc.bak ]; then
        mv ~/.inputrc ~/.inputrc.bak
        echo "Renamed .inputrc to .inputrc.bak"
    fi
    rm -rf ~/.gitconfig
fi

if [ -e ~/.gitconfig ]; then
    if [ ! -e ~/.gitconfig.bak ]; then
        mv ~/.gitconfig ~/.gitconfig.bak
        echo "Renamed .gitconfig to .gitconfig.bak"
    fi
    rm -rf ~/.gitconfig
fi

# create directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory: $1"
    fi
}

# Create necessary directories
create_dir "$HOME/.dotfiles"
create_dir "$HOME/.dotfiles/bin"
create_dir "$HOME/.dotfiles/system"

# Copy Dotfiles
cp "$SCRIPT_DIR/.bash_profile" ~/.bash_profile
cp -r "$SCRIPT_DIR/bin" ~/.dotfiles
cp -r "$SCRIPT_DIR/system" ~/.dotfiles
cp "$SCRIPT_DIR/.inputrc" ~/.inputrc
cp "$SCRIPT_DIR/git/.gitconfig" ~/.gitconfig

# Utilities
sudo apt install tree
