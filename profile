# $HOME/.profile: config to hold ENV vars and perform basic setup."

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

export GOPATH="$HOME/.go"

export HISTCONTROL=ignoredups:erasedups
