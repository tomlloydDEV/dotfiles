#!/usr/bin/env bash

set -eu

echo "Bootstrapping your development enviroment..."

# core packages
install_packages() {
  local packages=(git curl nvim tmux python3 python3-pip)
  echo "Installing core packages..."
  sudo apt update && sudo apt install -y "${packages[@]}"
  echo "Core packages installed."
}


