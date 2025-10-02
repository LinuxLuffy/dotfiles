#!/bin/bash

set -e

echo "updating system..."
sudo apt update && sudo apt upgrade -y

sudo apt install -y sway waybar curl stow kitty

echo "installing brave..."
curl -fsS https://dl.brave.com/install.sh | sh
