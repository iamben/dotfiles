#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias   g='/bin/grep --mmap --color=always'
alias   ls='/bin/ls --color=auto'

# agent forwarding
HOST=$HOST $HOME/bin/ssh-auth-sock
if [ -n "$WINDOW" ]; then
    export SSH_AUTH_SOCK="$HOME/.auth/ssh-agent-sock-$HOST"
fi
