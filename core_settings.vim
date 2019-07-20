" This file is for core vim settings

"  2 moving around (searching & patterns)
set incsearch			    "Show matches for partially typed searches
set ignorecase	    		"Searches are case insensitive...
set smartcase	    		"unless they have uppercase letters

"  3 tags
set tagrelative
set tags=tags,$HOME/.vim/tags

"  4 displaying text
set wrap
set linebreak		    	"Wrap lines at convenient points
set scrolloff=3			    "See the surrounding lines when cursor is at the edge of the screen
set number  	    	    "Absolute line numbers
set window=40
set textwidth=0             "Disable automatically creating a new line after 80 chars
set nolist

"  5 syntax, highlighting and spelling
set hlsearch
set spellfile=$HOME/.vim/spell/en.utf-8.add

"  6 multiple windows
set laststatus=2		    "Always show the status bar
set hidden			        "Keep files open in the background

"  8 terminal
set title	    		    "Set title in console

"  9 mouse
set mousemodel=popup_setpos "Enable context menu (right-click) in GUI

" 11 messages and info
set showcmd
set noshowmode              "Don't show mode, as Powerline makes it redundant
set ruler		    	    "Line/Col numbers in corner

" 13 editing text
set backspace=2			    "Working backspace
set nrformats=hex           "Don't use octal when incrementing numbers with leading zeros

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

" 17 key mapping
set ttimeoutlen=0

" 18 reading and writing files
set autoread			    "Read files when modified

" 20 command line editing
set history=100
set wildmode=list:longest,full	"ZSH-style path completion
set wildmenu
set wildignore=*.o,*.obj,*~     "Ignore these files when doing path-completion
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif
set wildignorecase

" Persistent undo
set undodir=~/.local/share/nvim/undo//
set undofile

" Don't store swap files in working dir - interacts poorly with NFS
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//

" Set colorscheme
if has('nvim')
    " Neovim: 24-bit colour scheme
    set termguicolors
    colorscheme molokai
elseif has('gui_running')
    " 24-bit colour scheme
    " We need to explicitly source ginit.vim here, since vim-qt doesn't, whereas Neovim does
    colorscheme molokai
    source ~/.vim/ginit.vim
else
    " 256 colour scheme
    colorscheme relaxedgreen
endif

