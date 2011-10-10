if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

alias grepp='grep -R --include="*.py"'

if [ -n "${PATH}" ] ; then
    export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin
fi

