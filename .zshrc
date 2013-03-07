# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
autoload -Uz vcs_info
compinit -D
# End of lines added by compinstall

#setopts
setopt MENUCOMPLETE
setopt ALL_EXPORT
setopt correct

#vars
PROMPT="(%T) %{[1;34m%}%n%{[m%}@%{[1;32m%}%m%{[m%}:%{[1;31m%}%~%{[m%} %# "
EDITOR='vim'
PAGER='less'
READNULLCMD='less'

#function
# Emulate tcsh's backward-delete-word
function tcsh-backward-delete-word () {
    #local WORDCHARS="${WORDCHARS:s#/#}"
    #local WORDCHARS='*?_[]~\/!#$%^<>|`@#$%^*()+?'
    local WORDCHARS="${WORDCHARS:s#/#}"
    zle backward-delete-word
}
 
function tcsh-backward-word () {
    local WORDCHARS="${WORDCHARS:s#/#}"
    zle emacs-backward-word
}
 
function tcsh-forward-word () {
    local WORDCHARS="${WORDCHARS:s#/#}"
    zle emacs-forward-word
}
 
zle -N tcsh-backward-delete-word
zle -N tcsh-backward-word
zle -N tcsh-forward-word
 
# key binding
bindkey "[1~" beginning-of-line	# Home
bindkey "[4~" end-of-line		# End
bindkey "[2~" overwrite-mode		# Ins
bindkey "[3~" delete-char		# Delete
bindkey "F" move-forward-char		# Forward char (original: ^F)
bindkey "B" move-backward-char	# Backward char ((original: ^B))
bindkey "[A" history-beginning-search-backward #up
bindkey "[B" history-beginning-search-forward #down

# Simulate tcsh
bindkey '^W' tcsh-backward-delete-word
bindkey '^F' tcsh-forward-word
bindkey '^B' tcsh-backward-word

#os configuration
if [ -f $HOME/.zsh/os/`uname -s`.zsh ]; then
    source $HOME/.zsh/os/`uname -s`.zsh
fi

#hosts configuration
if [ -f $HOME/.zsh/hosts/$HOST.zsh ]; then
    source $HOME/.zsh/hosts/$HOST.zsh
fi

#misc
if [ -n "`ls $HOME/.zsh/misc/*`" ]; then
    for z in `ls -1d $HOME/.zsh/misc/*`; do
	if [ -f $z ]; then
	    source $z
	elif [ -d $z ]; then
	    source $z/*.zsh
	fi
    done
else if [ -d ]
fi

