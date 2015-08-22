" ------------------------------------------------------------------------------
" Vim Configuration File
" By Simon Lee
" ------------------------------------------------------------------------------

    "> Important
    "> Vundle
    "> Moving Around, Searching and Patterns
    "> Tags
    "> Displaying Text
    "> Syntax, Highlighting and Spelling
    "> Multiple Windows
    "> Multiple Tab Pages
    "> Terminal
    "> Using the Mouse
    "> GUI
    "> Printing
    "> Messages and Info
    "> Selecting Text
    "> Editing Text
    "> Tabs and Indenting
    "> Folding
    "> Diff Mode
    "> Mapping
    "> Reading and Writing Files
    "> The Swap File
    "> Command Line Editing
    "> Executing External Commands
    "> Running Make and Jumping to Errors
    "> Language Specific
    "> Multi-Byte Characters
    "> Various

" ------------------------------------------------------------------------------
" ! Important
" ------------------------------------------------------------------------------
    set t_Co=256

    set pastetoggle=<F2>

    "open tags in split
    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" ------------------------------------------------------------------------------
" ! Vundle
" ------------------------------------------------------------------------------
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif

" ------------------------------------------------------------------------------
" ! Moving Around, Searching and Patterns
" ------------------------------------------------------------------------------
    " ignore case when using a search pattern
    set ignorecase

    " override 'ignorecase' when pattern has upper case character
    set smartcase

    "Show match for partly typed search command
    set incsearch

    "!open tags in split
    map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" ------------------------------------------------------------------------------
" ! Tags
" ------------------------------------------------------------------------------
    " List of file names to search for tags
    set tags=./tags;/


" ------------------------------------------------------------------------------
" ! Displaying Text
" ------------------------------------------------------------------------------
    " Do not wrap long lines
    set nowrap

    "Show line number for each line
    set number


" ------------------------------------------------------------------------------
" ! Syntax, Highlighting and Spelling
" ------------------------------------------------------------------------------
    "Highlight all matches for last used search pattern
    set hlsearch

    "Synatx Highlighting
    syntax on

    "Highlight Spelling Mistakes
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

    "!Highlight columns past 80
    let &colorcolumn=join(range(81,999),",")
    hi ColorColumn ctermbg=lightgrey guibg=lightgrey

    "!Highlight end of line whitespace.
    highlight WhitespaceEOL ctermbg=darkgreen guibg=darkgreen
    match WhitespaceEOL /\s\+$/
    func! DeleteTrailingSpace()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc


" ------------------------------------------------------------------------------
" ! Multiple Windows
" ------------------------------------------------------------------------------
    "Location for new window splits
    set splitbelow
    "set splitright

    "Show a status line even if there is only one window
    set laststatus=2


" ------------------------------------------------------------------------------
" ! Multiple Tab Pages
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" ! Terminal
" ------------------------------------------------------------------------------
    set ttyfast


" ------------------------------------------------------------------------------
" ! Using the Mouse
" ------------------------------------------------------------------------------

    "Use mouse if avaliable
    if has('mouse')
        set mouse=a
            if &term =~ '^screen'
                " tmux knows the extended mouse mode
                set ttymouse=xterm2
        endif
    endif

" ------------------------------------------------------------------------------
" ! GUI
" ------------------------------------------------------------------------------
"
" ------------------------------------------------------------------------------
" ! Printing
" ------------------------------------------------------------------------------
"
" ------------------------------------------------------------------------------
" ! Messages and Info
" ------------------------------------------------------------------------------
    "No annoying sounds on errors
    set noerrorbells
    set novisualbell

    " In the status bar, show incomplete commands as they are typed
    set showcmd

    " don't display the current mode (Insert, Visual, Replace) in the status line.
    set noshowmode


" ------------------------------------------------------------------------------
" ! Selecting Text
" ------------------------------------------------------------------------------
    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

" ------------------------------------------------------------------------------
" ! Editing Text
" ------------------------------------------------------------------------------
    "Backspace over everything
    set backspace=eol,start,indent

    "Show matching brackets when text indicator is over them
    set showmatch


" ------------------------------------------------------------------------------
" ! Tabs and Indenting
" ------------------------------------------------------------------------------
    "Use spaces instead of tabs
    set expandtab

    "Indent at the same level of the previous line
    set autoindent

    "Use Smart Tabs
    set smarttab

    "Set tab width to 4
    set shiftwidth=4
    set tabstop=4

    "!Reset visual block after indent/outdent
    vnoremap < <gv  " better indentation
    vnoremap > >gv  " better indentation


" ------------------------------------------------------------------------------
" ! Folding
" ------------------------------------------------------------------------------
    "set nofoldenable

    if has('folding')
        " When opening files, all folds open by default
        set nofoldenable

        set foldmethod=indent
    endif


" ------------------------------------------------------------------------------
" ! Diff Mode
" ------------------------------------------------------------------------------
    " start diff mode with vertical splits by default
    set diffopt+=vertical


" ------------------------------------------------------------------------------
" ! Mapping
" ------------------------------------------------------------------------------
    " Disable Arrow Keys
    nmap <Left> <Nop>
    nmap <Right> <Nop>
    nmap <Up> <Nop>
    nmap <Down> <Nop>
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>

    "! Auto close html tag with <//
    :iabbrev <// </<C-X><C-O>

    "! Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    let mapleader=","
" ------------------------------------------------------------------------------
" ! Reading and Writing Files
" ------------------------------------------------------------------------------
    " Load file when changed externally
    set autoread

    "! Automatic reloading of .vimrc
    autocmd! bufwritepost .vimrc source %

    " Turn off backup
    set nobackup
    set nowb

" ------------------------------------------------------------------------------
" ! The Swap File
" ------------------------------------------------------------------------------
    " Turn off swap
    set noswapfile


" ------------------------------------------------------------------------------
" ! Command Line Editing
" ------------------------------------------------------------------------------
    " Save more commands in history
    set history=200

    set wildmode=list:longest,full

    " ignore binary files
    set wildignore+=*.exe,*.png,*.jpg,*.gif,*.doc,*.mov,*.xls,*.msi

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc

    " Vim files
    set wildignore+=*.sw?,*.bak,tags

    " Enable auto complete menu
    set wildmenu


" ------------------------------------------------------------------------------
" ! Executing External Commands
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" ! Running make and jumping to errors
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" ! Language Specific
" ------------------------------------------------------------------------------
  "Toggle line wrap for tex files
  autocmd BufRead,BufNewFile   *.tex setlocal wrap linebreak colorcolumn=


" ------------------------------------------------------------------------------
" ! Multi-byte Characters
" ------------------------------------------------------------------------------
    set encoding=utf-8

" ------------------------------------------------------------------------------
" ! Various
" ------------------------------------------------------------------------------
    " Allow for cursor beyond last character
    set virtualedit=onemore


" ----------------------------------------------------------------------------
" Allow overriding these settings
" ----------------------------------------------------------------------------
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
