#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_DIRECTORY=$(cd "$SCRIPT_DIR/.." && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

symlink_settings() {
  rm -f "$VSCODE_SETTING_DIR/settings.json"
  ln -s "$DOT_DIRECTORY/apps/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
}

install_extensions() {
  while read -r line; do
    code --install-extension "$line"
  done < "$DOT_DIRECTORY/apps/vscode/extensions"
}

export_vscode_extensions() {
  code --list-extensions > "$DOT_DIRECTORY/apps/vscode/extensions"
}

main() {
  symlink_settings
  install_extensions
  export_vscode_extensions
}

main "$@"
