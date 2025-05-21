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
  )

  for dest in "${!files_to_link[@]}"; do
    echo "$dest"
  done

  for dest in "${!files_to_link[@]}"; do
    local src="${files_to_link[$dest]}"
    mkdir -p "$(dirname "$dest")"

    if [[ -e "$dest" || -L "$dest" ]]; then
      local filename
      filename=$(basename "$dest")
      mv "$dest" "$backup_dir/$filename.$(date +%s)"
    fi

    ln --symbolic --force "$src" "$dest"
  done
}

setup_git() {
  : # TODO: implement
}

configure_vscode() {
  : # TODO: implement
}

secure_machine() {
  : # TODO: implement
}
