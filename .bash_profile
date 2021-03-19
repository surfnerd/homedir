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
alias tmux="EVENT_NOKQUEUE=1 TERM=screen-256color-bce tmux"
alias sfind=mdfindonlyin
alias sfindg=mdfindonlyingrep
alias vim="mvim -v"

# added by Miniconda3 4.2.12 installer
#export PATH="/Users/goy/miniconda3/bin:$PATH"

# added by Anaconda3 4.2.0 installer
#export PATH="/Users/goy/anaconda3/bin:$PATH"

export PATH="/Users/goy/anaconda3/bin:/usr/local/go/bin:$PATH"
