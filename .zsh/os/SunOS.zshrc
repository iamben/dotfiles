#
setenv	LC_ALL	zh_TW.UTF-8
setenv	LANG	zh_TW.UTF-8
setenv TERM xtermc
setenv PATH /usr/ucb:${PATH}:/opt/csw/bin:/usr/pkg/bin:/usr/pkg/sbin:/usr/ucb:/opt/csw/gcc3/bin/
setenv MANPATH /usr/share/man:/usr/local/share/man:/opt/csw/share/man
which ggrep > /dev/null && alias grep='ggrep --color=always'
which glocate > /dev/null && alias locate=glocate
