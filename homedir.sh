#!/bin/bash
if [ $# -eq 0 ]; then
    echo "$(tput bold)usage:$(tput sgr0)"
	echo "	$(tput bold)update$(tput sgr0)"
	echo "		- updates your configuration files in your home director and backs up the old ones with the suffix '-old'"
	echo "	$(tput bold)clean$(tput sgr0)"
	echo "		- cleans up the backed up files"
	exit 1
fi

if [[ $1 == "update" ]]
then
	cd ~
	mv ~/.vim ~/.vim-old
	mv ~/.vimrc ~/.vimrc-old
	mv ~/.bash_profile ~/.bash_profile-old
	mv ~/.tmux.conf ~/.tmux.conf-old
	mv ~/.gitconfig ~/.gitconfig-old
    mv ~/.zshrc ~/.zshrc.old
	ln -s ~/homedir/.vim ~/.vim
	ln -s ~/homedir/.vimrc ~/.vimrc
	ln -s ~/homedir/.bash_profile ~/.bash_profile
	ln -s ~/homedir/.tmux.conf ~/.tmux.conf
	ln -s ~/homedir/.gitconfig ~/.gitconfig
	ln -s ~/homedir/.zshrc ~/.zshrc
	echo "updated your configurations"

elif [[ $1 == "clean" ]]
then
	echo "Cleaning up backup files:" 
	cd ~
	find . -maxdepth 1 -regex '.*\-old$' -exec rm {} + -print
	echo "Finished"
fi


