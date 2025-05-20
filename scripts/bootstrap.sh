#!/usr/bin/env bash

set -eu

install_packages() {
  local packages=(git curl wget python3 python3-pip nvim tmux btop tldr fzf ripgrep jq yq)
  echo "Installing core packages..."
  sudo apt update && sudo apt install -y "${packages[@]}"
  echo "Core packages installed."
}

link_dotfiles() {
  local dotfiles_dir="$HOME/dotfiles"
  local backup_dir="$HOME/dotfiles_backup"
  mkdir -p "$backup_dir"
  mkdir -p "$HOME/.config/alacritty"

  declare -A files_to_link=(
    ["$HOME/.bashrc"]="$dotfiles_dir/bashrc"
    ["$HOME/.config/starship.toml"]="$dotfiles_dir/.config/starship.toml"
    ["$HOME/.config/alacritty/alacritty.yml"]="$dotfiles_dir/.config/alacritty/alacritty.yml"
    # ["$HOME/.tmux.conf"]="$dotfiles_dir/tmux.conf" not got round to tmux yet
  )
}

setup_git() {...}

configure_vscode() {...}

secure_machine() {...}
