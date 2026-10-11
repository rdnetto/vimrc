#!/bin/bash
set -euxo pipefail

# Change to directory containing the script
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd

if [[ -z "$1" || "$1" != "light" && "$1" != "full" ]]; then
    echo "USAGE: ./install.sh [light|full]"
    echo "Installs Vim-Plug and selects the plug-in profile to use."
    exit 1
fi

echo "$1" > ~/profile

mkdir -p ~/.local/share/nvim/swap \
    ~/.local/share/nvim/backup \
    ~/.local/share/nvim/undo

# This won't exist if we didn't do a --recursive clone
if [ ! -d "./.vim-plug/.git" ]; then
    git submodule init
    git submodule update
fi

# Actually install the plugins
nvim +:PlugInstall +:qa
