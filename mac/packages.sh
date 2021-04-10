#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew install peco the_silver_searcher ctags python fzf git fish omf rbenv pyenv direnv wget yarn
# vscode, iterm2, sequel-pro
brew cask install visual-studio-code iterm2 homebrew/cask-versions/sequel-pro-nightly
brew install rcm

