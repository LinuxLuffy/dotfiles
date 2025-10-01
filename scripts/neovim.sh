#!/bin/bash

set -e

# Set Variables
NVIM_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz"
INSTALL_DIR="$HOME/.local"
TARGET_DIR="$INSTALL_DIR/nvim-linux-x86_64"
PROFILE_FILE="$HOME/.bashrc"

#download tarball
echo "downloading neovim..."
curl -L "$NVIM_URL" -o /tmp/nvim-linux-x86_64.tar.gz || { echo "failed to download"; exit 1; }

#unpacking
echo "unpacking at $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
tar -xzf /tmp/nvim-linux-x86_64.tar.gz -C "$INSTALL_DIR"

#updating PATH
if ! grep -q 'nvim-linux-x86_64' "$PROFILE_FILE"; then
	echo "adding neovim to $PROFILE_FILE..."
	echo 'export PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH"' >> "$PROFILE_FILE"
else
	echo "PATH already exist"
fi

#removing tar
rm /tmp/nvim-linux-x86_64.tar.gz

#source bash file
source $PROFILE_FILE
echo "installation completed"
