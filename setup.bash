#!/usr/bin/bash
echo Setting up vim env ..
git clone https://github.com/iljoo/vimfiles.git  ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
