#!/bin/bash

set -u
DOT_DIRECTORY=$(cd $(dirname $0) && pwd)
GREEN='\033[0;32m'
NC='\033[0m' # No Color

brew_install()  {
  printf "start brew install"
  sh ./mac/packages.sh
  printf "${GREEN}Success brew install${NC}"
}

install_ohmyzsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

setup_zsh() {
  printf "start setup zsh"
  ln -snfv ${DOT_DIRECTORY}/.zshrc ${HOME}/.zshrc
  source ~/.zshrc
  printf "${GREEN}Success create link.${NC}"
}

main() {
  brew_install
  install_ohmyzsh
  setup_zsh
}

main "$@"
