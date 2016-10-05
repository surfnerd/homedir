export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\$ '

# mdfind uses the spotlight index to find keywords
# the -onlyin option specifies a directory to look in
function mdfindonlyin()
{
	mdfind -onlyin . $1
}

function mdfindonlyingrep()
{
	mdfind -onlyin . $1 | grep $2
}

alias ll="ls -al"
alias tmux="TERM=screen-256color-bce tmux"
alias sfind=mdfindonlyin
alias sfindg=mdfindonlyingrep
