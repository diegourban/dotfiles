# .zshrc
# Author: Diego Leonardo Urban
# Login-shell setup (Homebrew, PATH from installers) lives in ~/.zprofile.

# Function definitions.
[[ -f ~/.functions ]] && . ~/.functions

# Alias definitions.
[[ -f ~/.aliases ]] && . ~/.aliases

# Homebrew keg-only tools ($HOMEBREW_PREFIX is set by `brew shellenv` in ~/.zprofile).
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/mysql-client/bin:$PATH"

# Java: Temurin casks, switched with `jdk <version>` (see ~/.functions).
jdk 25 >/dev/null

# Go: binaries installed with `go install` (incl. golang.org/dl toolchains).
export PATH="$PATH:$HOME/go/bin"

# Postman CLI.
export PATH="$HOME/.local/bin:$PATH"

# Machine-local secrets and overrides (untracked, never commit).
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local
