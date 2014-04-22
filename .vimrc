"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration File
"
" Author: 
"   Simon Lee
"
" Version: 
"   1.0 - 27/12/13 
"
" Sections:
"   -> General
"   -> Navigation
"   -> VIM user interface
"   -> Colors and Fonts
"   -> Tab Settings
"   -> Future Settings?
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimLeave * :!clear
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow escape with jj
imap jj <Esc>

" Insert blank line below/above with Enter/Shift+Enter
nmap <Enter> o<Esc>k

" Run Make with F9
nmap <F9> :!make<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" Sets how many lines of command history to keep
set history=100

" Set to auto read when a file is changed from the outside
set autoread

" keep a backup file
" set backup        
:set noswapfile
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Enable mouse if avaliable in terminal emulator
if has('mouse')
    set mouse=a
endif

"" allow backspacing over everything in insert mode
set backspace=eol,start,indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show matching brackets when text indicator is over them
set showmatch

" No annoying sounds on errors
set noerrorbells
set novisualbell

" Turn on the Wid menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Display line numbers
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

set t_Co=256

colorscheme elflord

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Use Smart Tabs
set smarttab

" Set tabwidth to 4
set shiftwidth=2
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Future Settings?
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set wildmode=longest:full,full
