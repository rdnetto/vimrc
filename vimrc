"  1 important
version 6.0
set nocompatible


" =============== Begin Vundle Initialization ===============
filetype off                "This needs to be disabled for this section

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles to be managed: (do not put comments on the same lines as these)
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-easy-align'
Bundle 'sjl/gundo.vim.git'
Bundle 'vimez/vim-showmarks'
Bundle 'klen/python-mode'

colorscheme pablo           "Default colour scheme

filetype plugin indent on	"Enable filetype detection
syntax on
" ===============  End Vundle Initialization  ===============


"  2 moving around (searching & patterns)
set incsearch			    "Show matches for partially typed searches
set ignorecase	    		"Searches are case insensitive...
set smartcase	    		"unless they have uppercase letters

"  4 displaying text
set wrap
set linebreak		    	"Wrap lines at convenient points
set scrolloff=3			    "See the surrounding lines when cursor is at the edge of the screen
set nu	     	    	    "Absolute line numbers
set window=40

"  5 syntax, highlighting and spelling
set hlsearch

"  6 multiple windows
set laststatus=2		    "Always show the status bar
set hidden			        "Keep files open in the background

"  8 terminal
set title	    		    "Set title in console

" 11 messages and info
set showcmd
set nosmd                   "Don't show mode, as Powerline makes it redundant 
set ruler		    	    "Line/Col numbers in corner

" 13 editing text
set bs=2			        "Working backspace

" 14 tabs and indenting
set autoindent
set nosmartindent           "Disabled - causes issues with filetype based indentation
set smarttab
set expandtab			    "Expand tabs to spaces
set tabstop=4	    		"Width of a tab
set shiftwidth=4	    	"Use tabstop value for indenting

" 15 folding
set foldmethod=syntax		"Use syntax-dependent folding
set nofoldenable        	"Don't fold by default

" 18 reading and writing files
set autoread			    "Read files when modified

" 20 command line editing
set history=100
set wildmode=list:longest	"BASH-style path completion
set wildmenu
set wildignore=*.o,*.obj,*~     "Ignore these files when doing path-completion
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif
set wildignorecase

silent !mkdir ~/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo		"Persistent undo
set undofile


" Plugin settings
let g:EasyMotion_leader_key = '<Leader>'    " Don't require a double tap of leader key for EasyMotion

" PyMode settings
let g:pymode_lint_ignore = "E501,E251,E262,E226,E261,W0401,E303,E128,E124,W391,E203"
let g:pymode_lint_mccabe_complexity = 25

" Relative line numbers in Normal mode only
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Remap home button to act like ^ instead of 0
" NOTE: make sure that you have no trailing spaces, as they affect mappings
:nmap <Home> ^
:imap <Home> <Esc>^i

" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
