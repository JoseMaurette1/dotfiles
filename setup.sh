#!/bin/bash

# Dotfiles setup script
# This script creates symlinks from your dotfiles to their proper locations

set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$HOME/.config"

echo "🔗 Setting up dotfiles..."
echo "Dotfiles directory: $DOTFILES_DIR"

# Create .config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    local name="$3"
    
    echo "Setting up $name..."
    
    if [ -L "$target" ]; then
        echo "  Removing existing symlink: $target"
        rm "$target"
    elif [ -e "$target" ]; then
        echo "  Backing up existing $name to ${target}.backup"
        mv "$target" "${target}.backup"
    fi
    
    echo "  Creating symlink: $target -> $source"
    ln -s "$source" "$target"
    echo "  ✅ $name setup complete"
}

# Setup Neovim configuration
if [ -d "$DOTFILES_DIR/nvim" ]; then
    create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim" "Neovim"
else
    echo "⚠️  nvim directory not found in dotfiles"
fi

# Setup VSCode configuration (if it exists)
if [ -d "$DOTFILES_DIR/vscode" ]; then
    create_symlink "$DOTFILES_DIR/vscode" "$CONFIG_DIR/Code/User" "VSCode"
fi

echo ""
echo "🎉 Dotfiles setup complete!"
echo "Your configurations are now symlinked and ready to use."