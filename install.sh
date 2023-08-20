#!/bin/bash

set -u
DOT_DIRECTORY=$(cd $(dirname $0) && pwd)
# DOT_CONFIG_DIRECTORY=".config"
# IGNORE_PATTERN="^\.(git|config|chrome|mac|vscode|README.md|install.sh|vscode_install.sh|)"

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
  # TODO: 今の所ホワイトリスト方式で問題ないが後々ブラックリスト方式へ変更する。
  # cd ${DOT_DIRECTORY}
  # for f in .??*; do
  #     # 無視したいファイルやディレクトリ
  #     [[ "$f" =~ $IGNORE_PATTERN ]] && continue
  #     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
  # done
  ln -snfv ${DOT_DIRECTORY}/.zshrc ${HOME}/.zshrc
  printf "${GREEN}Success create link.${NC}"
  source ~/.zshrc
}

# printf "link .config directory dotfiles"
# cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
# for file in `\find . -maxdepth 8 -type f`; do
# #./の2文字を削除するためにfile:2としている
#     ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
# done
# printf "${GREEN}linked dotfiles complete!${NC}"

main() {
  brew_install
  install_ohmyzsh
  setup_zsh
}

main "$@"
