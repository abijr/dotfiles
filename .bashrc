#############################
# Author: abijr
#############################

alias ls='ls --color=auto'
alias ll='ls --color | less'
alias ..='cd ..'
alias :q='exit'
alias xterm='xterm -vb'
 
# Git stuff 
alias gita='git add'
alias gito='git push origin master'
alias gitc='git commit -m' 
 
_isroot=false
[ $UID -eq 0 ] && _isroot=true

if ! $_isroot; then
	alias pacman='sudo pacman' 
fi

# Define something using google
# Taken from brisbin's .bashrc
define() {
	which lynx &>/dev/null || return 1

	local lang="${LANG%%_*}"
	local charset="${LANG##*.}"
  
	lynx -accept_all_cookies -dump -hiddenlinks=ignore -nonumbers -assume_charset="$charset" -display_charset="$charset" "http://www.google.com/search?hl=$lang&q=define%3A+$1&btnG=Google+Search" | grep -m 5 -C 2 -A 5 -w "*" > /tmp/define

	if [ ! -s /tmp/define ]; then
		echo -e "No definition found.\n"
	else
		echo -e "$(grep -v Search /tmp/define | sed "s/$1/\\\e[1;32m&\\\e[0m/g")\n"
	fi

	rm -f /tmp/define
}

 
# PS1 :: Bash promt 
PS1='\033[0;;32m{ \033[0;;m\u \033[0;;32m} \033[0;1;31m:: \033[0;;m[ \h ] \033[0;1;31m:: \033[0;;m[ \W ] \n [[ \$ ]] >> '

eval `dircolors -b`

set -o vi
 
 

# Exports
export EDITOR="vim"
export LANG=en_EN.utf8
export LC_ALL=en_US.utf8
export BROWSER="firefox"
export TERM=xterm-256color
export MAIL=/home/abijr/Mail/inbox
