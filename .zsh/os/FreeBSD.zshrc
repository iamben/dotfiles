#
alias   ls='/bin/ls -G'
alias   g='/usr/bin/grep --mmap --color=always'
TERMCAP='xterm|xterm-color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'
LESS="-Rf"
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

$HOME/bin/setScreenSshAgent
if [ -z $WINDOW ]; then
	SSH_AUTH_SOCK="$HOME/.screen/ssh-agent-screen-$HOST"
fi
