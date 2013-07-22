#!/bin/bash
#This script downloads and installs Vundle, then updates the list of installed packages

if [ -d "~/.vim/bundle" ]; then
    mkdir ~/.vim/bundle
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleClean +BundleInstall +qa
echo "Please install exuberant-ctags, ack-grep and compile YCM"
