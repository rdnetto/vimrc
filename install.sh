#!/bin/sh
set -e

#Need to manually install the package manager, so it can pull everything else in
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# YCM is too big to be installed automatically (download times out)
git clone --recursive https://github.com/Valloric/YouCompleteMe.git "~/.vim/bundle/YouCompleteMe" 
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang

