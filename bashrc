# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR="vim"

#

# Uncomment the following line if you don't like systemctl's auto-paging feature:

# export SYSTEMD_PAGER=
export PS1="\[\033[1;33m\]\u@\[\033[1;33m\]\\h: \[\033[1;36m\]\w >\n\[\033[1;31m\][\t]\[\033[1m\]\$\[\033[0;00m\] "

## For p4 config
export P4CONFIG=P4CONFIG

# User specific aliases and functions
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='vim'
alias vun='vim'
alias krm='ssh-keygen -R'
alias fn='find -name'
alias gitk='gitkraken'
