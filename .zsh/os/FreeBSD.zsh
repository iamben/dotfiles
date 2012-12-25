#
alias   ls='/bin/ls -G'
alias   g='/usr/bin/grep --mmap --color=always'
export TERMCAP='xterm|xterm-color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'
export LESS="-Rf"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LSCOLORS="Exfxcxdxbxegedabagacad"
export PYTHONSTARTUP="$HOME/.pythonstartup"

HOST=$HOST $HOME/bin/setScreenSshAgent
if [ -n "$WINDOW" ]; then
	SSH_AUTH_SOCK="$HOME/.screen/ssh-agent-screen-$HOST"
fi
