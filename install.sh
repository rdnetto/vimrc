#!/bin/bash
set -e

if [[ -z "$1" || "$1" != "light" && "$1" != "full" ]]; then
    echo "USAGE: ./install.sh [light|full]"
    echo "Installs NeoBundle and selects the plug-in profile to use."
    exit 1
fi

echo "$1" > ~/.vim/profile

mkdir -p ~/.config
cd ~/.config
ln -s nvim ~/.vim
cd - >/dev/null

#Need to manually install the package manager, so it can pull everything else in
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# YCM is too big to be installed automatically (download times out)
if [[ "$1" == "full" ]]; then
    git clone --recursive https://github.com/Valloric/YouCompleteMe.git "$HOME/.vim/bundle/YouCompleteMe"
    $HOME/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang

    echo "Please install app-vim/automatictexplugin for full LaTeX support."
fi

