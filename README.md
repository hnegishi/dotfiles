# Setup

Install HomeBrew

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to PATH:

```
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hnegishi/.zprofile
$ eval "$(/opt/homebrew/bin/brew shellenv)"
```

Install git for git clone this repo & [Connecting to GitHub with SSH](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh)

```
$ brew install git
```

Clone this repo

```
$ git clone git@github.com:hnegishi/dotfiles.git
```

# Usage

- brew install & create symlink

```bash
$ ./install.sh
```

- VScode install settings and extension

```bash
$ ./vscode_install.sh
```
