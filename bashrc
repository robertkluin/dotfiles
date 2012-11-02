if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

alias gae='cd /usr/local/google_appengine/'
alias mutt='cd ~/Desktop && mutt'

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

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

if [ -n "${PATH}" ] ; then
    export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin
fi

