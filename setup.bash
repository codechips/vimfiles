#!/usr/bin/bash
echo Setting up vim env ..
git clone https://github.com/iljoo/vimfiles.git  ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
