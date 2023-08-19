#!/bin/sh

brew update
brew upgrade
brew install the_silver_searcher ctags jq wget \
# fish fzf omf \
peco zsh-completions zsh-syntax-highlighting zsh-autosuggestions \
autoconf \
yarn \
rbenv pyenv nodenv tfenv direnv \
gitleaks

brew install --cask slack visual-studio-code iterm2 tableplus sequel-ace docker postman
# TODO: rcmでdotfilesを管理する
# brew install rcm
