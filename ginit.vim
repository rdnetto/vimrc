" This file is automatically sourced by neovim-qt
" GuiFont can only be called in this file, since it is sourced *after* the shim plugin has been loaded.

" Set font, accounting for DPI. Desktop has 95 (on 1920x1200), yuki has 96
if has("nvim")
    if system("xdpyinfo | perl -ne '/resolution.*x([0-9]+)/ && print $1;'") < 96
        GuiFont Droid Sans Mono:h11
    else
        GuiFont Droid Sans Mono:h14
    endif
else
    if system("xdpyinfo | perl -ne '/resolution.*x([0-9]+)/ && print $1;'") < 96
        set guifont=Droid\ Sans\ Mono\ 11
    else
        set guifont=Droid\ Sans\ Mono\ 14
    endif
fi

