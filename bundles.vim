" Lists the plugins to install/load

" Colour schemes
" Nice color schemes: pablo, xterm16, relaxedgreen, vividchalk.
" Comparison: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
Plug 'Relaxed-Green'
Plug 'tomasr/molokai'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chrisbra/Recover.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/TaskList.vim'
Plug 'bogado/file-line'
Plug 'nathanaelkane/vim-indent-guides'

" Movement
Plug 'easymotion/vim-easymotion'
Plug 'pgdouyon/vim-evanesco'

" Text objects
Plug 'michaeljsmith/vim-indent-object'

" Text editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'kana/vim-niceblock'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'

" Misc
Plug 'restore_view.vim'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-rooter'

if g:profile  ==? "full"
    " languages to load clang-based plugins for (YCM, color_coded)
    let g:clang_languages = ['c', 'cpp', 'cs', 'python', 'haskell']

    " Tag support (requires exuberant-ctags)
    Plug 'majutsushi/tagbar'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-pyref'
    Plug 'xolox/vim-easytags'

    " Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    if has('ruby')
        Plug 'FriedSock/smeargle'
    endif

    " Debugging
    Plug 'mattboehm/vim-unstack'
    Plug 'idanarye/vim-vebugger', {'branch' : 'develop'}

    " Language specific
    Plug 'klen/python-mode'
    Plug 'adimit/prolog.vim'
    Plug 'wannesm/wmgraphviz.vim'
    Plug 'LaTeX-Box-Team/LaTeX-Box'
    Plug 'trapd00r/irc.vim'
    Plug 'idanarye/vim-dutyl', {'branch' : 'develop'}
    Plug 'lepture/vim-velocity'

    " Haskell
    Plug 'eagletmt/ghcmod-vim'
    Plug 'eagletmt/neco-ghc'
    Plug 'itchyny/vim-haskell-indent'
    Plug 'itchyny/vim-haskell-sort-import'
    Plug 'Twinside/vim-haskellFold'

    " needed by ghc-mod
    Plug 'Shougo/vimproc.vim'

    " Misc
    Plug 'editorconfig/editorconfig-vim'

    if has('lua')
        Plug 'jeaye/color_coded', {
                    \ 'do'  : 'cmake -DCMAKE_C_COMPILER=gcc-4.9.2 -DCMAKE_CXX_COMPILER=g++-4.9.2 . && make -j6',
                    \ 'for' : g:clang_languages,
                    \ }
    endif

    " Use lazy-loading for YCM as it takes ~800ms otherwise
    Plug 'rdnetto/YCM-Generator', {'branch' : 'develop'}
    Plug 'Valloric/YouCompleteMe', {
                    \ 'do'  :  './install.py --clang-completer --system-libclang',
                    \ 'for' : g:clang_languages,
                    \ }
endif

