"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configuration File
"
" Author: Simon Lee
"
" Version: 2.0 - 25/04/14
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! General
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nocompatible              " Be iMproved

  let mapleader=","

  " Automatic reloading of .vimrc
  autocmd! bufwritepost .vimrc source %

  "Split window right by default
  set splitbelow
  "set splitright

  set t_Co=256

  "Load file when changed externally
  set autoread

  "Language-Dependent Indenting
  filetype plugin indent on

  " Open tag definition in a new vsplit
  set tags=./tags;/
  map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

  "Turn off backup
  set nobackup
  set nowb
  set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Vundle
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  filetype off                  " Required by Vundle

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  "Status Line for vim
  Bundle 'itchyny/lightline.vim'
  "Bundle 'scrooloose/nerdtree'

  "Snippets
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  Bundle 'garbas/vim-snipmate'
  Bundle 'honza/vim-snippets'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'kien/ctrlp.vim'
  Bundle 'Raimondi/delimitMate'
  Bundle 'scrooloose/syntastic'
  call vundle#end()

  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  "let g:NERDTreeDirArrows=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Visual
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Synatx Highlighting
  syntax on

  "Default Colorscheme
  colorscheme molokai

  "Highlight columns past 80
  let &colorcolumn=join(range(81,999),",")
  hi ColorColumn ctermbg=lightgrey guibg=lightgrey

  "Set syntax highlighting
  syntax on

  "Display line numbers
  set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Key Bindings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Disable Arrow Keys
  nmap <Left> <Nop>
  nmap <Right> <Nop>
  nmap <Up> <Nop>
  nmap <Down> <Nop>
  imap <up> <nop>
  imap <down> <nop>
  imap <left> <nop>
  imap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Navigation
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Highlight search results
  set hlsearch

  "Incremental search
  set incsearch

  "Use mouse if avaliable
  if has('mouse')
    set mouse=a
    if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
  endif

  "Backspace over everything
  set backspace=eol,start,indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Tab, Indentation Settings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Use spaces instead of tabs
  set expandtab

  "Indent at the same level of the previous line
  set autoindent

  "Use Smart Tabs
  set smarttab

  "Set tab width to 4
  set shiftwidth=2
  set tabstop=2

  "Reset visual block after indent/outdent
  vnoremap < <gv  " better indentation
  vnoremap > >gv  " better indentation


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Formatting
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set pastetoggle=<F2>
  set nowrap                      " Do not wrap long lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! VIM User Interface
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Auto fold code
  set nofoldenable
  set foldmethod=indent

  "Show status bar
  set laststatus=2

  "Show matching brackets when text indicator is over them
  set showmatch

  "No annoying sounds on errors
  set noerrorbells
  set novisualbell

  "Enable auto complete menu
  set wildmenu

  "set spell
  if has("spell")
    " turn spelling on by default
    set spell

    " toggle spelling with F4 key
    map <F4> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

    " they were using white on white
    highlight PmenuSel ctermfg=black ctermbg=lightgray

    " limit it to just the top 10 items
    set sps=best,10
  endif
  "Ignore compiled files
  set wildignore=*.o,*~,*.pyc

map \ :NERDTreeToggle <CR>

"Highlight end of line whitespace.
  highlight WhitespaceEOL ctermbg=darkgreen guibg=darkgreen
  match WhitespaceEOL /\s\+$/
  func! DeleteTrailingSpace()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
  endfunc
