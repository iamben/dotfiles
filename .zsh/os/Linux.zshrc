#
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
alias   g='/bin/grep --mmap --color=always'

$HOME/bin/setScreenSshAgent
if [ -n "$WINDOW" ]; then
	SSH_AUTH_SOCK="$HOME/.screen/ssh-agent-screen-$HOST"
fi
