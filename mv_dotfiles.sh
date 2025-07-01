#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"

# List of dotfiles to manage
FILES_TO_MOVE=(".bashrc" ".bash_profile" ".viminfo" ".vimrc" ".gitconfig" ".gitignore" ".tmux.conf" ".zshrc")

# Create the .dotfiles directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"

# Move and link only if not already done
for file in "${FILES_TO_MOVE[@]}"; do
    src="$HOME/$file"
    dest="$DOTFILES_DIR/$file"

    if [ -L "$src" ]; then
        echo "$file is already a symlink, skipping."
    elif [ -f "$src" ]; then
        if [ ! -f "$dest" ]; then
            echo "Moving $file to $DOTFILES_DIR and creating symlink..."
            mv "$src" "$dest"
            ln -s "$dest" "$src"
        else
            echo "$file already exists in $DOTFILES_DIR, skipping move."
        fi
    else
        echo "$file not found or already handled, skipping."
    fi
done

echo "Dotfiles check complete."
