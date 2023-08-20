#!/bin/bash

set -u
DOT_DIRECTORY=$(cd $(dirname $0) && pwd)
# DOT_CONFIG_DIRECTORY=".config"
# IGNORE_PATTERN="^\.(git|config|chrome|mac|vscode|README.md|install.sh|vscode_install.sh|)"

GREEN='\033[0;32m'
NC='\033[0m' # No Color

########### brew ##########
printf "start brew install"
sh ./mac/packages.sh
printf "${GREEN}Success brew install${NC}"

########## zsh ##########
printf "Create dotfile link to home directory."
# cd ${DOT_DIRECTORY}
# for f in .??*; do
#     # 無視したいファイルやディレクトリ
#     [[ "$f" =~ $IGNORE_PATTERN ]] && continue
#     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
# done

# TODO: 今の所ホワイトリスト方式で問題ないが後々ブラックリスト方式へ変更する。
# oh-my-zshのインストール
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -snfv ${DOT_DIRECTORY}/.zshrc ${HOME}/.zshrc
source ~/.zshrc
printf "${GREEN}Success create link.${NC}"

# printf "link .config directory dotfiles"
# cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
# for file in `\find . -maxdepth 8 -type f`; do
# #./の2文字を削除するためにfile:2としている
#     ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
# done
# printf "${GREEN}linked dotfiles complete!${NC}"
