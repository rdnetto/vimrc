" This file is automatically sourced by neovim-qt
" GuiFont can only be called in this file, since it is sourced *after* the shim plugin has been loaded.
call ResetFontSize()

" Disable GUI tabline, since airline's is nicer.
" See https://github.com/equalsraf/neovim-qt/issues/366
GuiTabline 0

" Setting SUDO_ASKPASS as a workaround for https://github.com/tpope/vim-eunuch/issues/56
let $SUDO_ASKPASS = '/usr/bin/ksshaskpass'

