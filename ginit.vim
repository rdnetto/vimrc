" This file is automatically sourced by neovim-qt
" GuiFont can only be called in this file, since it is sourced *after* the shim plugin has been loaded.

" Set font to whatever Konsole uses
" We can't do this heuristically because Shuriken and Yuki have the same DPI
if has("nvim")
    let s:cmd = "GuiFont Droid Sans Mono for Powerline:h"
else
    let s:cmd = "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ "
endif

let s:fontsize = system("awk -F, '/^Font=/{print $2}' ~/.local/share/konsole/*.profile | head -n1")
execute s:cmd . s:fontsize

