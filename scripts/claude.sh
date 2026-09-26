#!/bin/bash
# apps/claude/mcp.json の定義を Claude Code のユーザースコープ MCP として登録する。
# ~/.claude.json は Claude Code が書き換える状態ファイルなので直接管理せず、
# 定義だけを dotfiles に置いて `claude mcp add-json` で流し込む。
# 何度実行しても同じ結果になる（既存の同名サーバーは削除してから登録し直す）。
#
# 注意: Slack の MCP (mcp.slack.com) は動的クライアント登録に非対応のため、
# ここでは登録できない。claude.ai のコネクタ経由で使うこと。

set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
DOT_DIRECTORY=$(cd "$SCRIPT_DIR/.." && pwd)
MCP_FILE="$DOT_DIRECTORY/apps/claude/mcp.json"

GREEN='\033[0;32m'
NC='\033[0m'

if ! command -v claude >/dev/null; then
  echo "claude コマンドが見つかりません。先に Claude Code をインストールしてください。" >&2
  exit 1
fi
if ! command -v jq >/dev/null; then
  echo "jq が見つかりません。make brew を先に実行してください。" >&2
  exit 1
fi

printf "Registering user-scope MCP servers from %s...\n" "$MCP_FILE"

for name in $(jq -r '.mcpServers | keys[]' "$MCP_FILE"); do
  json=$(jq -c --arg n "$name" '.mcpServers[$n]' "$MCP_FILE")
  claude mcp remove -s user "$name" >/dev/null 2>&1 || true
  claude mcp add-json -s user "$name" "$json" >/dev/null
  printf "  %s\n" "$name"
done

printf "${GREEN}MCP servers registered. Run 'claude mcp list' to check auth status.${NC}\n"
