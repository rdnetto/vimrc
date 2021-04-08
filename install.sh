#!/bin/bash
set -e

if [[ -z "$1" || "$1" != "light" && "$1" != "full" ]]; then
    echo "USAGE: ./install.sh [light|full]"
    echo "Installs Vim-Plug and selects the plug-in profile to use."
    exit 1
fi

echo "$1" > ~/.vim/profile

mkdir -p ~/.config ~/.local/share/nvim/swap ~/.local/share/nvim/backup ~/.local/share/nvim/undo
(cd ~/.config && ln -s ../.vim nvim)

# This won't exist if we didn't do a --recursive clone
if [ ! -d "$HOME/.vim/.vim-plug/.git" ]; then
    git submodule init
    git submodule update
fi

# Download & compile YCM
if [[ "$1" == "full" && ! -d "$HOME/.vim/bundle/YouCompleteMe" ]]; then
    git clone --recursive https://github.com/Valloric/YouCompleteMe.git "$HOME/.vim/bundle/YouCompleteMe"
    "$HOME/.vim/bundle/YouCompleteMe/install.sh" --clang-completer --system-libclang

    echo "Please install app-vim/automatictexplugin for full LaTeX support."
fi

# Actually install the plugins
nvim +:PlugInstall +:qa

