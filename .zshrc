# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/iamben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#setopts
setopt MENUCOMPLETE
setopt ALL_EXPORT

#vars
PROMPT="(%T) %{[1;34m%}%n%{[m%}@%{[1;32m%}%m%{[m%}:%{[1;31m%}%~%{[m%} %# "
TERMCAP='xterm|xterm-color:Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm:tc=xterm-xfree86:'
EDITOR='vim'
PAGER='less'
READNULLCMD='less'

#alias
#alias vi=vim

#key binding
bindkey "[1~" beginning-of-line   # Home
bindkey "[4~" end-of-line	    # End
bindkey "[2~" overwrite-mode	    # Ins
bindkey "[3~" delete-char	    # Delete
bindkey "[A" history-search-backward	#up
bindkey "[B" history-search-forward	#down
#bindkey "^W"	backward-delete-word

#aliases
if [ -f $HOME/.zsh/aliases ]; then
    source $HOME/.zsh/aliases
fi

#os configuration
if [ -f $HOME/.zsh/os/`uname -s`.zshrc ]; then
    source $HOME/.zsh/os/`uname -s`.zshrc
fi

#hosts configuration
if [ -f $HOME/.zsh/hosts/$HOST.zshrc ]; then
    source $HOME/.zsh/hosts/$HOST.zshrc
fi
