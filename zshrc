
# Make a fine looking prompt
# ==========================
# I have been using this style of prompt since roughly 1997. I don't want to
# change, even though newfangled stuff like powerline is all the rage now...

if [ -n "$SSH_CONNECTION" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # For SSH sessions, show hostname.
    PROMPT='%F{green}%n@%F{red}%m%F{white}:%B%F{blue}%2~%b%F{white}%(!.#.$) '
else
    # For local sessions, do NOT show hostname.
    PROMPT='%F{green}%n%F{white}:%B%F{blue}%2~%b%F{white}%(!.#.$) '
fi

# ZSH preferences
# =======================
# Basically, I'd like a large history and to ignore duplicates

# History stuff
# -------------
HISTSIZE=1000000
SAVEHIST=1000000

setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY


# Autocomplete stuff
# -------------
zstyle ':completion:*' menu select

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# Configure ls color preferences
# ===========================
# The defaults can be hard to see on certain displays. This improves the
# contrast just a bit.
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


# Helpful aliases
# ===============
# Many of these are related to colorized output

# Politely ask ls to use colors.
# Linux and BSDs (like OSX) need told in different ways.
if [ "$(uname -s)" = "Linux" ]; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

# This is just a nice shortcut
alias ll='ls -la'

# Colorized grep is so much nicer
alias grep='grep --color=auto'

# Helper to clean up dead git branches
alias clean-branches='~/.dotfiles/helpers/cleanup_branches'

# Make a fancy color theme happen to my shell
if [ -f "$HOME/.dotfiles/zsh/base16-gruvbox-dark-medium.sh" ]; then
    . "$HOME/.dotfiles/zsh/base16-gruvbox-dark-medium.sh"
fi


# Setup GPG prompt for git commit signing
export GPG_TTY=$(tty)

# Some nice helper functions
# ==========================
# These are just a few 

function grepp () {
  echo "Grepping for $@"
  grep -R --include="*.py" "$@" * ;
}

function grepe () {
  echo "Grepping for $@"
  grep -R --include="*.elm" "$@" * ;
}

function grepj () {
  echo "Grepping for $@"
  grep -R --include="*.js" "$@" * ;
}

# This is mostly for brew
export PATH="/usr/local/sbin:$PATH"


