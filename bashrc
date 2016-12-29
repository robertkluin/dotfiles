# $HOME/.bashrc: non-login shell bash config

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -f /etc/profile ]; then
    source /etc/profile
fi

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

export HISTCONTROL=ignoredups:erasedups

function itermtitle () {
  # The 0 is the mode: 0 - tab and window; 1 - tab; 2 - window
  echo -ne "\033]0;$@\007"
}

function grepp () {
  echo "Grepping for $@"
  grep -R --include="*.py" "$@" * ;
}

function grepa () {
  echo "Grepping for $@"
  grep -R --include="*.as" "$@" * ;
}

function grepj () {
  echo "Grepping for $@"
  grep -R --include="*.coffee" --include="*.js" "$@" * ;
}

