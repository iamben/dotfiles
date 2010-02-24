alias	iamben	'/usr/bin/ssh -24CA -p222 iamben@iamben.csie.net'
alias	csduty	'/usr/bin/ssh -24CA csduty'
alias   g       '/usr/bin/grep --color=always'
alias	less	'/usr/bin/less -r'

#colorized ls
if ( $OSTYPE != "solaris" ) then
	alias   ls      '/bin/ls -G'
endif

setenv LC_ALL en_US.UTF-8
setenv LANG en_US.UTF-8
setenv LESSCHARDEF "8bcccbcc18b95.."
setenv EDITOR vim
setenv PAGER less

set autolist

#screen auth sock
if ( $OSTYPE != "solaris" ) then
	$HOME/bin/setScreenSshAgent
	if ($?WINDOW) then
    		setenv SSH_AUTH_SOCK "$HOME/.screen/ssh-agent-screen-$HOST"
	endif
endif

if ( $OSTYPE == "FreeBSD" ) then
	setenv TERMCAP 'xterm|xterm-color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'
endif

#home , end , and delete key mapping
if( $?term ) then
	if ($term == "xterm" || $term == "vt100" || $term == "vt102" || $term !~ "con*") then
		# bind keypad keys for console, vt100, vt102, xterm
		bindkey "\e[1~" beginning-of-line  # Home
		bindkey "\e[7~" beginning-of-line  # Home rxvt
		bindkey "\e[2~" overwrite-mode     # Ins
		bindkey "\e[3~" delete-char        # Delete
		bindkey "\e[4~" end-of-line        # End
		bindkey "\e[8~" end-of-line        # End rxvt
	endif
endif

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "(%T) %{\033[1;34m%}%n%{\033[m%}@%{\033[1;32m%}%m%{\033[m%}[ %{\033[1;31m%}%~%{\033[m%} ]# "

	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif
