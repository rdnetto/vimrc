" Lists the plugins to install/load

" Colour schemes
" Nice color schemes: pablo, xterm16, relaxedgreen, vividchalk.
" Comparison: http://vimcolorschemetest.googlecode.com/svn/html/index-c.html
Plug 'vim-scripts/Relaxed-Green'
Plug 'tomasr/molokai'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
" Fzf.vim has a dependency on the Vimscript included with fzf
Plug '/usr/share/vim/vimfiles' | Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
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
Plug 'tpope/vim-commentary'
Plug 'kana/vim-niceblock'
Plug 'junegunn/vim-easy-align'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vim-scripts/ReplaceWithRegister'

" Misc
Plug 'vim-scripts/restore_view.vim'
Plug 'tpope/vim-eunuch'
Plug 'neomake/neomake'
Plug 'airblade/vim-rooter'
Plug 'nelstrom/vim-markdown-folding'
Plug 'jremmen/vim-ripgrep'

if g:profile  ==? 'full'
    " languages to load clang-based plugins for (YCM, color_coded)
    let g:clang_languages = ['c', 'cpp', 'cs', 'python', 'haskell']

    " Tag support (requires exuberant-ctags)
    Plug 'majutsushi/tagbar'
    Plug 'ludovicchabant/vim-gutentags'

    " Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Debugging
    Plug 'idanarye/vim-vebugger', {'branch' : 'develop'}

    " Language specific
    Plug 'klen/python-mode'
    Plug 'wannesm/wmgraphviz.vim'
    Plug 'LaTeX-Box-Team/LaTeX-Box'
    Plug 'trapd00r/irc.vim'
    Plug 'lepture/vim-velocity'
    Plug 'duganchen/vim-soy'
    Plug 'cespare/vim-toml'
    Plug 'rust-lang/rust.vim'
    Plug 'junegunn/vader.vim'
    Plug 'LnL7/vim-nix'
    Plug 'leafgarland/typescript-vim'
    Plug 'udalov/kotlin-vim'
    Plug 'jvirtanen/vim-hcl'
    Plug 'hashivim/vim-terraform'

    " Haskell
    Plug 'eagletmt/neco-ghc'
    Plug 'itchyny/vim-haskell-indent'
    Plug 'itchyny/vim-haskell-sort-import'
    Plug 'Twinside/vim-haskellFold'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'parsonsmatt/intero-neovim'

    " Misc
    Plug 'editorconfig/editorconfig-vim'

    " Use lazy-loading for YCM as it takes ~800ms otherwise
    " TODO: Replace with ALE - provides syntax checking, LSP integration, native Neovim use of async
    " Also consider treesitter, telescope
    Plug 'rdnetto/YCM-Generator', {'branch' : 'develop'}
    Plug 'Valloric/YouCompleteMe', {
                    \ 'do'  :  './install.py --clang-completer --system-libclang',
                    \ 'for' : g:clang_languages,
                    \ }

    Plug 'github/copilot.vim'
endif

