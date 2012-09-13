if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

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

