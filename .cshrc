setenv	EDITOR	vim
setenv	PAGER	less
set	autolist
complete sudo 'p/1/c/'
complete man 'p/1/c/'

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

if ( $?prompt ) then
	# An interactive shell -- set some stuff up
	set prompt = "(%T) %{\033[1;34m%}%n%{\033[m%}@%{\033[1;32m%}%m%{\033[m%}:%{\033[1;31m%}%~%{\033[m%} # "

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

#os configuration
if( -f $HOME/.csh/os/`uname -s`.cshrc ) then
	source $HOME/.csh/os/`uname -s`.cshrc
endif

#hosts configuration
if( -f $HOME/.csh/hosts/$HOST.cshrc ) then
	source $HOME/.csh/hosts/$HOST.cshrc
endif

#aliases
if( -f $HOME/.csh/aliases ) then
	source $HOME/.csh/aliases
endif
