#!/usr/bin/env bash

set -eu

log_file="$HOME/bootstrap.log"
exec > >(tee -a "$log_file") 2>&1

install_packages() {
  local packages=(git curl wget python3 python3-pip gh alacritty starship nvim tmux btop tldr fzf ripgrep jq yq)
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
  echo "Dotfiles linked."
}

setup_git() {
  git config --global user.name "tomlloydDEV"
  git config --global user.email "tom111b@hotmail.co.uk"

  if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
    ssh-keygen -t ed25519 -C "tom111b@hotmail.co.uk" -f "$HOME/.ssh/id_ed25519" -N ""
    echo "SSH key generated."
  else
    echo "SSH key already exists."
  fi

  if ! gh auth status &>/dev/null; then
    echo "Please authenticate with GitHub:"
    gh auth login
  else
    echo "GitHub CLI already authenticated."
  fi

  local key_title
  key_title="tomlloydDEV-$(hostname)"

  if gh ssh-key list | grep -q "$key_title"; then
    echo "SSH key already added to GitHub with title: $key_title"
  else
    gh ssh-key add "$HOME/.ssh/id_ed25519.pub" --title "$key_title"
    echo "SSH key added to GitHub with title: $key_title"
  fi
}

configure_vscode() {
  : # TODO: implement
}

secure_machine() {
  : # TODO: implement
}
