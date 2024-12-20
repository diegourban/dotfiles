# .zshrc
# Author: Diego Leonardo Urban

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.zsh_aliases, instead of adding them here directly.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# diegourban/dotfiles related commands {{{
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# }}}

export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
