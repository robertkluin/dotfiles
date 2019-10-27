

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# The next line enables shell command completion for gcloud.
if [ -e /usr/local/Cellar/node/7.2.0/bin ]; then
    export PATH=$PATH:/usr/local/Cellar/node/7.2.0/bin
fi

# Setup virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

