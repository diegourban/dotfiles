#!/bin/zsh
# Bootstrap diegourban/dotfiles (bare repo in ~/.cfg, work tree = $HOME).
# Safe to re-run. See README.md.
set -euo pipefail

REPO_HTTPS="https://github.com/diegourban/dotfiles.git"
REPO_SSH="git@github.com:diegourban/dotfiles.git"
CFG="$HOME/.cfg"
BACKUP="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"

config() { /usr/bin/git --git-dir="$CFG" --work-tree="$HOME" "$@"; }

# 1. Clone over HTTPS (works before SSH keys exist), push over SSH later.
if [[ ! -d "$CFG" ]]; then
  /usr/bin/git clone --bare "$REPO_HTTPS" "$CFG"
fi
config remote set-url origin "$REPO_SSH"
# A bare clone has no fetch refspec, so origin/* branches would never exist.
config config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
config config status.showUntrackedFiles no
config config core.hooksPath "$HOME/.bin/hooks"
config config user.email "diego.urban88@gmail.com"

# 2. Check out, moving any pre-existing files that would be overwritten into a backup dir.
if ! config checkout 2>/dev/null; then
  echo "Backing up pre-existing dotfiles to $BACKUP"
  config ls-tree -r --name-only HEAD | while read -r f; do
    if [[ -e "$HOME/$f" ]]; then
      mkdir -p "$BACKUP/$(dirname "$f")"
      mv "$HOME/$f" "$BACKUP/$f"
    fi
  done
  config checkout
fi
echo "Dotfiles checked out."

# 3. Homebrew packages (skip if Homebrew is not installed yet).
if command -v brew >/dev/null 2>&1 || [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle --file "$HOME/.bin/Brewfile"
else
  echo "Homebrew not found: install it from https://brew.sh, then run: brew bundle --file ~/.bin/Brewfile"
fi

cat <<'MSG'

Next steps (machine-local, never committed):
  ~/.zshrc.local     secrets/tokens as exports
  ~/.aliases.local   work-specific aliases
  ~/.gitconfig.local machine-local git config
MSG
