
# install Homebrew
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

add Homebrew to PATH:
```
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hnegishi/.zprofile
$ eval "$(/opt/homebrew/bin/brew shellenv)"
```

install git for git clone this repo
```
$ brew install git
```

# Usage

- brew install & create link
```bash
$ ./install.sh
```

- VScode install settings and extension
```bash
$ ./vscode_install.sh
```
