#
setenv	LC_ALL	en_US.UTF-8
setenv	LANG	en_US.UTF-8
alias   g       '/bin/grep --mmap --color=always'

# agent forwarding
$HOME/bin/ssh-auth-sock
if ($?WINDOW) then
    setenv SSH_AUTH_SOCK "$HOME/.auth/ssh-agent-sock-$HOST"
fi
