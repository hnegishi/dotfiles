#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY=".config"

IGNORE_PATTERN="^\.(git|config|chrome|mac|vscode|README.md|install.sh|vscode_install.sh|)"

echo "start brew install"
sh ./mac/packages.sh
echo "end brew install"

echo "Create dotfile link to home directory."
cd ${DOT_DIRECTORY}
# for f in .??*; do
#     # 無視したいファイルやディレクトリ
#     [[ "$f" =~ $IGNORE_PATTERN ]] && continue
#     ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
# done

# TODO: 今の所ホワイトリスト方式で問題ないが後々ブラックリスト方式へ変更する。
ln -snfv ${DOT_DIRECTORY}/.zshrc ${HOME}/.zshrc
echo "Success create link."

# echo "link .config directory dotfiles"
# cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
# for file in `\find . -maxdepth 8 -type f`; do
# #./の2文字を削除するためにfile:2としている
#     ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
# done
# echo "linked dotfiles complete!"
