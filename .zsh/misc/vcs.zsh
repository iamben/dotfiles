rprompt_vcs_setup () {
 
#Initialization
 
  local -A pc
 
  pc['vcs']=${1:-'yellow'}
  pc['normal']=${2:-'grey'}
 
 
# zstyle setup of the vcs_info display
# Information in "man zshcontrib"
 
# check for changes in the git repository
# 
# can be slow, comment it out if you encounter delays
  zstyle ':vcs_info:git:*' check-for-changes true
 
# Format when some action is going on in 
# your repository (rebranch,merge conflict, ...)
#
  zstyle ':vcs_info:*' actionformats \
    "%F{$pc['vcs']}[%s|%b|%a]%F{$pc['normal']}"
  zstyle ':vcs_info:*' actionformats \
    "%F{$pc['vcs']}%c %u [%s|%b|%a]%F{$pc['normal']}"
# Default format: [git|master]  
  zstyle ':vcs_info:*' formats       \
    "%F{$pc['vcs']}[%s|%b]%F{$pc['normal']}"
  zstyle ':vcs_info:git:*' formats       \
    "%F{$pc['vcs']}%c %u [%s|%b]%F{$pc['normal']}"
 
# Different branch formats
# [svn|www-1173739]
  zstyle ':vcs_info:*' branchformat '%b-%r'
 
# Used VCS use 
# %  vcs_info_printsys 
# for supported systems 
  zstyle ':vcs_info:*' enable svn git
 
# get vcs_info to collect informations
  precmd(){ 
 
    if [ "$PWD" != "$HOME" ]; then
	vcs_info
	# Print the VCS info
	RPROMPT="${vcs_info_msg_0_}"
    else
	RPROMPT=""
    fi
  }

}

if [ -z "`vcs_info |& grep found`" ]; then
    rprompt_vcs_setup "$@"
    #echo "VCS is currently disabled."
fi

