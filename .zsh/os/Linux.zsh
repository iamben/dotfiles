#
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
alias   g='/bin/grep --mmap --color=always'
alias   ls='/bin/ls --color=auto'

HOST=$HOST $HOME/bin/setScreenSshAgent
if [ -n "$WINDOW" ]; then
	SSH_AUTH_SOCK="$HOME/.screen/ssh-agent-screen-$HOST"
fi
