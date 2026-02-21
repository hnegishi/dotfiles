#!/bin/bash

set -u

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_DIRECTORY=$(cd "$SCRIPT_DIR/.." && pwd)

GREEN='\033[0;32m'
NC='\033[0m'

printf "Creating symlinks...\n"

# zsh
ln -snfv "$DOT_DIRECTORY/config/zsh/.zshrc" "$HOME/.zshrc"

# Claude Code
mkdir -p "$HOME/.claude"
ln -snfv "$DOT_DIRECTORY/apps/claude/settings.json" "$HOME/.claude/settings.json"

printf "${GREEN}Symlinks created successfully.${NC}\n"
