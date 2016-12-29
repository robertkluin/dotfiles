

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/bobert/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/bobert/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/bobert/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/bobert/Downloads/google-cloud-sdk/completion.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -e /usr/local/Cellar/node/7.2.0/bin ]; then
    export PATH=$PATH:/usr/local/Cellar/node/7.2.0/bin
fi

# Setup virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi


