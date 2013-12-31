# Tell ls and grep to use colorized output.

# If color overrides are desired...
if [ -f /etc/dircolors ]; then
    eval $(dircolors -b /etc/dircolors)

    if [ -f "$HOME/.dircolors" ] ; then
        eval $(dircolors -b "$HOME/.dircolors")
    fi
fi

# ls
if [ "$(uname -s)" == "Linux" ]; then
    alias ls='ls --color=auto'
else
   alias ls='ls -G'
fi

# Setup an alias for `ll`
alias ll='ls -la'

# grep
alias grep='grep --color=auto'

