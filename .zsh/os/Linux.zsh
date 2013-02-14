#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias   g='/bin/grep --mmap --color=always'
alias   ls='/bin/ls --color=auto'

# agent forwarding, for screen and tmux
HOST=$HOST $HOME/bin/ssh-auth-sock
if [ -n "$WINDOW" -o -n "$TMUX" ]; then
    export SSH_AUTH_SOCK="$HOME/.auth/ssh-agent-sock-$HOST"
fi
