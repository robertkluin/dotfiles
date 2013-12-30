# Tell ls and grep to use colorized output.

# If color overrides are desired...
if [ -f /etc/dircolors ]; then
    eval $(dircolors -b /etc/dircolors)

    if [ -f ~/.dircolors ] ; then
        eval $(dircolors -b ~/.dircolors)
    fi
fi

# ls
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

# Setup an alias for `ll`
alias ll='ls -la'

# grep
alias grep='grep --color=auto'

