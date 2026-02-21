#!/bin/bash

set -u

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_DIRECTORY=$(cd "$SCRIPT_DIR/.." && pwd)

GREEN='\033[0;32m'
NC='\033[0m'

brew_install() {
  printf "Installing packages...\n"
  bash "$SCRIPT_DIR/packages.sh"
  printf "${GREEN}Packages installed successfully.${NC}\n"
}

install_ohmyzsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    printf "Installing Oh My Zsh...\n"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  else
    printf "Oh My Zsh is already installed.\n"
  fi
}

setup_symlinks() {
  bash "$SCRIPT_DIR/symlink.sh"
  source ~/.zshrc
}

main() {
  brew_install
  install_ohmyzsh
  setup_symlinks
}

main "$@"
