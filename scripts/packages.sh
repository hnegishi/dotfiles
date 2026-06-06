#!/bin/sh

brew update
brew upgrade
brew install the_silver_searcher ctags jq wget gnupg \
peco zsh-completions zsh-autocomplete zsh-syntax-highlighting zsh-autosuggestions \
autoconf \
uv \
yarn \
asdf rbenv pyenv goenv tfenv direnv \
gitleaks gh

brew install --cask \
  google-chrome slack spotify \
  visual-studio-code \
  iterm2 warp ghostty \
  tableplus sequel-ace medis \
  docker postman

# Claude Code (native install - auto-updates)
curl -fsSL https://claude.ai/install.sh | bash

# Node.js via asdf
asdf plugin add nodejs || true
asdf install nodejs latest
asdf global nodejs latest

# Codex CLI (requires Node.js)
npm i -g @openai/codex

# TODO: rcmでdotfilesを管理する
# brew install rcm
