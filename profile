# ~/.profile: config to hold ENV vars and perform basic setup.

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export GOPATH=~/.go
