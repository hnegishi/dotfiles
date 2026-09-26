.PHONY: install brew link vscode mcp all

all: install

install: brew link vscode mcp

brew:
	@bash scripts/packages.sh

link:
	@bash scripts/symlink.sh

vscode:
	@bash scripts/vscode.sh

mcp:
	@bash scripts/mcp.sh
