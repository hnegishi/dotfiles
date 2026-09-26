.PHONY: install brew link vscode claude all

all: install

install: brew link vscode claude

brew:
	@bash scripts/packages.sh

link:
	@bash scripts/symlink.sh

vscode:
	@bash scripts/vscode.sh

claude:
	@bash scripts/claude.sh
