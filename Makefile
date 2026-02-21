.PHONY: install brew link vscode all

all: install

install: brew link vscode

brew:
	@bash scripts/packages.sh

link:
	@bash scripts/symlink.sh

vscode:
	@bash scripts/vscode.sh
