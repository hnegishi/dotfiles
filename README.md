# dotfiles

## セットアップ

Homebrew をインストール:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

git をインストールし、[GitHub に SSH 接続](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh)を設定:

```bash
brew install git
```

このリポジトリをクローン:

```bash
git clone git@github.com:hnegishi/dotfiles.git
cd dotfiles
```

## 使い方

```bash
# 一括セットアップ: brew + シンボリンク + VSCode
make install

# 個別実行
make brew      # Homebrew パッケージのインストール
make link      # シンボリンクの作成
make vscode    # VSCode の設定・拡張機能セットアップ
```

## ディレクトリ構成

```
dotfiles/
├── Makefile              # エントリポイント
├── config/               # シンボリンク対象の設定ファイル
│   └── zsh/.zshrc
├── apps/                 # アプリ固有の設定
│   ├── claude/
│   ├── vscode/
│   └── chrome/
├── scripts/              # セットアップスクリプト
│   ├── install.sh        # フルセットアップ (brew + oh-my-zsh + シンボリンク)
│   ├── packages.sh       # Homebrew パッケージ
│   ├── symlink.sh        # シンボリンク作成
│   └── vscode.sh         # VSCode セットアップ
└── .github/workflows/    # CI
```
