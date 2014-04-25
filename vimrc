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
  " Automatic reloading of .vimrc
  autocmd! bufwritepost .vimrc source %

  "Load file when changed externally
  set autoread

  "Language-Dependent Indenting
  filetype plugin indent on
  
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
  Bundle 'scrooloose/nerdtree'
  Bundle 'Valloric/YouCompleteMe'
  Bundle 'scrooloose/syntastic'
  call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Visual
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Synatx Highlighting
  syntax on

  "Set syntax highlighting
  syntax on 

  "Display line numbers
  set number 
  
  "Default Colorscheme
  colorscheme elflord 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! Key Bindings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Disable Arrow Keys
  inoremap  <Up>     <NOP>
  inoremap  <Down>   <NOP>
  inoremap  <Left>   <NOP>
  inoremap  <Right>  <NOP>
  noremap   <Up>     <NOP>
  noremap   <Down>   <NOP>
  noremap   <Left>   <NOP>
  noremap   <Right>  <NOP>

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
  set pastetoggle=<F3>   
  set nowrap                      " Do not wrap long lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "! VIM User Interface
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Auto fold code
  set foldenable
  set foldmethod=indent
  set foldclose=all

  "Show matching brackets when text indicator is over them
  set showmatch 

  "No annoying sounds on errors
  set noerrorbells 
  set novisualbell

  "Enable auto complete menu
  set wildmenu 

  "set spell

  "Ignore compiled files
  set wildignore=*.o,*~,*.pyc 

map \ :NERDTreeToggle <CR>




















