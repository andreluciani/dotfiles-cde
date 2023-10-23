# If not running interactively, don't do anything
if [ -z "$PS1" ]; then
    return
fi

if [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return
fi

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{functions,env,alias,prompt}; do
    source "$DOTFILE"
done

# Set LSCOLORS
eval "$(dircolors -b "$DOTFILES_DIR"/system/.dir_colors)"

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Wrap up
export DOTFILES_DIR
