#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color'
#PS1='[\u@\h \W]\$ '
export PS1="\[\033[1;33m\]\u@\[\033[1;33m\]\\h: \[\033[1;36m\]\w >\n\[\033[1;31m\][\t]\[\033[5m\]\$\[\033[0;00m\] "
