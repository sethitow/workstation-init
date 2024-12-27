# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.cargo" ] ; then
    . "$HOME/.cargo/env"
fi

if [ -e /opt/homebrew/bin/brew ] ; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [ -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin" ] ; then
    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
fi


alias k='kubectl'
