#!/bin/bash 

ln -s vimrc ~/.vimrc 
ln -s gvimrc ~/.gvimrc 
ln -s vim ~/.vim 

git submodule init
git submodule update
cd bundle/commandt && rake make
