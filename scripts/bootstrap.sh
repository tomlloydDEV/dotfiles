#!/usr/bin/env bash

set -eu

install_packages() {
  local packages=(git curl wget python3 python3-pip nvim tmux btop tldr fzf ripgrep jq yq)
  echo "Installing core packages..."
  sudo apt update && sudo apt install -y "${packages[@]}"
  echo "Core packages installed."
}

link_dotfiles() {...}

setup_git() {...}

configure_vscode() {...}

secure_machine() {...}
