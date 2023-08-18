#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew install git gitleaks \
peco the_silver_searcher ctags jq\
fzf fish omf \
autoconf 
wget yarn \
rbenv pyenv direnv tfenv python nodenv
# vscode, iterm2, sequel-pro
brew install --cask visual-studio-code iterm2 homebrew/cask-versions/sequel-pro-nightly tableplus sequel-ace docker
brew install rcm

