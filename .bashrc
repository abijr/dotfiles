alias ls='ls --color=auto'
alias ll='ls --color=auto | less'
alias ..='cd ..'
alias :q='exit'
alias xterm='xterm -vb'
PS1='\033[0;;32m{ \033[0;;m\u \033[0;;32m} \033[0;1;31m:: \033[0;;m[ \h ] \033[0;1;31m:: \033[0;;m[ \W ] \n [[ \$ ]] >> '

eval `dircolors -b`

set -o vi

export EDITOR="vim"
export LANG=en_EN.utf8
export LC_ALL=en_US.utf8
export BROWSER="firefox"
export TERM=xterm-256color
export MAIL=/home/abijr/Mail/inbox
