#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

symlink_settings() {
  rm "$VSCODE_SETTING_DIR/settings.json"
  ln -s "$SCRIPT_DIR/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
}

# symlink_keybindings() {
#   rm "$VSCODE_SETTING_DIR/keybindings.json"
#   ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"
# }

install_extention() {
  cat "$SCRIPT_DIR/vscode/extensions" | while read line
  do
    code --install-extension $line
  done
}

export_vscode_extensions() {
  code --list-extensions > "$SCRIPT_DIR/vscode/extensions"
}

main() {
  symlink_settings
  # symlink_keybindings
  install_extention
  export_vscode_extensions
}

main "$@"
