#
setenv	LC_ALL	en_US.UTF-8
setenv	LANG	en_US.UTF-8
alias   g       '/bin/grep --color=always'

$HOME/bin/setScreenSshAgent
if ($?WINDOW) then
	setenv SSH_AUTH_SOCK "$HOME/.screen/ssh-agent-screen-$HOST"
endif
