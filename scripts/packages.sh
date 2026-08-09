#!/bin/sh

brew update
brew upgrade
brew install the_silver_searcher ctags jq wget gnupg \
peco zsh-completions zsh-autocomplete zsh-syntax-highlighting zsh-autosuggestions \
autoconf \
uv \
yarn \
herdr \
asdf rbenv tfenv direnv \
gitleaks gh

brew install --cask \
  google-chrome slack spotify \
  visual-studio-code \
  warp ghostty \
  tableplus sequel-ace medis \
  docker postman

# Claude Code (native install - auto-updates)
curl -fsSL https://claude.ai/install.sh | bash

# herdr Claude Code integration (~/.claude/hooks/herdr-agent-state.sh を生成)
herdr integration install claude

# Node.js via asdf
asdf plugin add nodejs || true
asdf install nodejs latest
asdf global nodejs latest

# Codex CLI (requires Node.js)
npm i -g @openai/codex

# TODO: rcmでdotfilesを管理する
# brew install rcm
