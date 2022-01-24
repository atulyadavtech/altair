######History Mgmt ##############
export HISTSIZE=100000 #For CentOS/RHEL
export HISTCONTROL=erasedups
export HISTTIMEFORMAT='%F %T	'
shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
