#!/bin/bash
# apps/claude/mcp.json に書いた MCP サーバー定義を、Claude Code のユーザースコープに登録する。
#
# ユーザースコープの定義は ~/.claude.json に保存されるが、このファイルは dotfiles で直接は管理しない。
# Claude Code が起動のたびに書き換える状態ファイルであり、アカウント情報や各プロジェクトの履歴も
# 含まれているため、シンボリックリンクにすると差分が絶えず生じる。
# そこで定義だけを mcp.json に置き、`claude mcp add-json` で ~/.claude.json に反映する。
#
# 実行するたびに同名のサーバーを削除してから登録し直すので、何度実行しても結果は同じになる。
#
# Slack の MCP (mcp.slack.com) はここでは登録できない。動的クライアント登録に対応しておらず、
# Claude Code 単体では OAuth のクライアント ID を取得できないためである。
# Slack は claude.ai 側で登録済みのコネクタを使う。

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_DIRECTORY=$(cd "$SCRIPT_DIR/.." && pwd)
MCP_FILE="$DOT_DIRECTORY/apps/claude/mcp.json"

GREEN='\033[0;32m'
NC='\033[0m'

printf "Registering user-scope MCP servers from %s...\n" "$MCP_FILE"

for name in $(jq -r '.mcpServers | keys[]' "$MCP_FILE"); do
  json=$(jq -c --arg n "$name" '.mcpServers[$n]' "$MCP_FILE")
  claude mcp remove -s user "$name" >/dev/null 2>&1 || true
  claude mcp add-json -s user "$name" "$json" >/dev/null
  printf "  %s\n" "$name"
done

printf "${GREEN}MCP servers registered. Run 'claude mcp list' to check auth status.${NC}\n"
