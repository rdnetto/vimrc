" We need to dynamically determine the path to the file, because the vimrc
" directory is under a different location on Windows
execute ("source " . expand("<sfile>:p:h:h") . "/.vim-plug/plug.vim")

