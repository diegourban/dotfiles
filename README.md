# dotfiles for [@diegourban](https://github.com/diegourban)

## Requirements
- Homebrew
- cURL
- Git

## Install

### 1. Homebrew
Install Homebrew by running:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. cURL
Install cURL via Homebrew by running:
```
brew install curl
```

Run the following to make brew cURL the default one in your shell:
```
echo 'export PATH="$(brew --prefix)/opt/curl/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### 3. GIT

Install GIT by running:
```
brew install git
```

### 4. Config
Install config tracking in your `$HOME` by running:
```
curl -Lks https://raw.githubusercontent.com/diegourban/dotfiles/main/.bin/install.zsh | /bin/zsh
```

## Reference
[Dotfiles: Best Way to Store in a Bare Git Repository ](https://www.atlassian.com/git/tutorials/dotfiles)
