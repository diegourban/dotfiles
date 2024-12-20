# .zshrc
# Author: Diego Leonardo Urban

# Function definitions.
if [ -f ~/.functions ]; then
    . ~/.functions
fi

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
