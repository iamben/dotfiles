#
alias   ls      '/bin/ls -G'
alias   g       '/usr/bin/grep --mmap --color=always'
alias	less	'/usr/bin/less -r'
setenv	TERMCAP 'xterm|xterm-color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'
setenv	LC_ALL	en_US.UTF-8
setenv	LANG	en_US.UTF-8

$HOME/bin/setScreenSshAgent
if ($?WINDOW) then
	setenv SSH_AUTH_SOCK "$HOME/.screen/ssh-agent-screen-$HOST"
endif
