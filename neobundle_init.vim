" NeoBundle initialization code

" Initialize
if has ('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle#install_max_processes = 8
let g:neobundle#install_process_timeout = 500

" NeoBundle dependencies
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

" Plugins are divided into two profiles: light and full. (full is a superset of light)
let s:profileFile = expand('~/.vim/profile')
if filereadable(s:profileFile)
    let g:profile = readfile(s:profileFile, '', 1)[0]
else
    let g:profile = 'light'
endif

" Load bundles
source ~/.vim/bundles.vim

" Finalize
call neobundle#end()
NeoBundleCheck

" Enable built-in plugins
filetype indent on
syntax on
runtime macros/matchit.vim

