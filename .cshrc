if(! $?prompt) exit	# this chain only includes interactive settings

if (-f /bin/zsh || -f /usr/local/bin/zsh) then
    echo "==Zsh Detected=="
    echo "Type anything to use original shell or enter for zsh: "
    if ( "$<" == "" ) then
	if( -f /bin/zsh ) then
	    exec env SHELL=/bin/zsh /bin/zsh -l
	else
	    exec env SHELL=/usr/local/bin/zsh /usr/local/bin/zsh -l
	endif
    endif
endif

setenv	EDITOR	vim
setenv	PAGER	less
set	autolist

complete sudo 'p/1/c/'

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
	set prompt = "(%T) %{\033[1;34m%}%n%{\033[m%}@%{\033[1;32m%}%m%{\033[m%}:%{\033[1;31m%}%~%{\033[m%} %# "

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

#colorful man
setenv LESS_TERMCAP_mb '[38;5;135m' # begin blinking
setenv LESS_TERMCAP_md '[38;5;220m' # begin bold
setenv LESS_TERMCAP_me '[0m' # end mode
setenv LESS_TERMCAP_so '[38;5;225m' # begin standout-mode - info box
setenv LESS_TERMCAP_se '[0m' # end standout-mode
setenv LESS_TERMCAP_us '[2;1;4;32m' # begin underline
setenv LESS_TERMCAP_ue '[0m' # end underline

#os configuration
if( -f $HOME/.csh/os/`uname -s`.cshrc ) then
	source $HOME/.csh/os/`uname -s`.cshrc
endif

#hosts configuration
if( -f $HOME/.csh/hosts/$HOST.cshrc ) then
	source $HOME/.csh/hosts/$HOST.cshrc
endif

#aliases
foreach src ($HOME/.csh/misc/*)
	if ( -f $src ) then
		source $src
	endif
end

