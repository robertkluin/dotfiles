if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

function grepp () {
  echo "Grepping for $@"
  grep -R --include="*.py" "$@" * ;
}

function grepa () {
  echo "Grepping for $@"
  grep -R --include="*.as" "$@" * ;
}

if [ -n "${PATH}" ] ; then
    export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin
fi

