#! bin/bash

cd ~
mv ~/.vim .vim-old
mv ~/.vimrc .vimrc-old
mv ~/.bash_profile .bash_profile-old

ln -s homedir/.vim ~/.vim
ln -s homedir/.vimrc ~/.vimrc
ln -s homedir/.bash_profile ~/.bash_profile
