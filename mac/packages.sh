#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew install peco the_silver_searcher ctags python fzf git fish omf rbenv pyenv direnv wget yarn
brew cask install visual-studio-code
brew install rcm

