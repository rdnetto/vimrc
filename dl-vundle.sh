#!/bin/sh
#This script downloads and installs Vundle
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qa
echo "Please install exuberant-ctags, ack-grep and compile YCM"
