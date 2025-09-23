#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting lazygit installation..."

# Detect the operating system
OS="$(uname -s)"

if [[ "$OS" == "Linux" ]]; then
    # Check for Arch Linux
    if [ -f /etc/arch-release ]; then
        echo "Detected Arch Linux. Installing lazygit..."
        sudo pacman -S --noconfirm lazygit
    else
        echo "Unsupported Linux distribution. Please install lazygit manually."
        exit 1
    fi
elif [[ "$OS" == "Darwin" ]]; then
    echo "Detected macOS. Installing lazygit..."
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install Homebrew first: https://brew.sh/"
        exit 1
    fi
    brew install lazygit
else
    echo "Unsupported operating system: $OS. Please install lazygit manually."
    exit 1
fi

echo "lazygit has been installed successfully."
