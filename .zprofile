# .zprofile
# Author: Diego Leonardo Urban
# Login-shell setup. Runs before ~/.zshrc.

# Homebrew (also sets $HOMEBREW_PREFIX used by ~/.zshrc).
eval "$(/opt/homebrew/bin/brew shellenv)"

# JetBrains Toolbox launcher scripts.
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# OrbStack: command-line tools and integration.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
