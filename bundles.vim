" Lists the plugins to install/load

" Colour schemes
" Nice color schemes: pablo, xterm16, relaxedgreen, vividchalk.
" Comparison: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
NeoBundle 'Relaxed-Green'
NeoBundle 'tomasr/molokai'

" UI
NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'bogado/file-line'
NeoBundle 'nathanaelkane/vim-indent-guides'

" Movement
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'jayflo/vim-skip'
NeoBundle 'nelstrom/vim-visual-star-search'

" Text objects
NeoBundle 'michaeljsmith/vim-indent-object'

" Text editing
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'kana/vim-niceblock'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'scrooloose/nerdcommenter'

" Misc
NeoBundle 'restore_view.vim'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rdnetto/vim-rooter'

if g:profile  ==? "full"
    " Tag support (requires exuberant-ctags)
    NeoBundle 'majutsushi/tagbar'
    NeoBundle 'xolox/vim-misc'
    NeoBundle 'xolox/vim-pyref'
    NeoBundle 'xolox/vim-easytags'

    " Git integration
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'tpope/vim-fugitive'

    if has('ruby')
        NeoBundle 'FriedSock/smeargle'
    endif

    " Debugging
    NeoBundle 'mattboehm/vim-unstack'
    NeoBundle 'idanarye/vim-vebugger'

    " Language specific
    NeoBundle 'klen/python-mode'
    NeoBundle 'adimit/prolog.vim'
    NeoBundle 'wannesm/wmgraphviz.vim'
    NeoBundle 'eagletmt/ghcmod-vim'
    NeoBundle 'bitc/vim-hdevtools'
    NeoBundle 'eagletmt/neco-ghc'
    NeoBundle 'Twinside/vim-haskellFold'
    NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
    NeoBundle 'trapd00r/irc.vim'

    " Omnicomplete - use lazy loading since it adds ~800ms to startup
    NeoBundle 'rdnetto/YCM-Generator'
    NeoBundleLazy 'Valloric/YouCompleteMe', {
                    \ 'build' : {
                    \     'unix' : './install.sh --clang-completer --system-libclang',
                    \    },
                    \ 'augroup' : 'youcompletemeStart'
                    \ }
    autocmd FileType c,cpp,cs,python,haskell NeoBundleSource YouCompleteMe
endif

