" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ============================================================================
" " Active plugins
" " You can disable or add new ones here:
"
" " Plugins from github repos:
"
"" Python and PHP Debugger
" Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" " Code commenter
Bundle 'scrooloose/nerdcommenter'
" " Aute pair
Bundle 'jiangmiao/auto-pairs'
" " Class/module browser
" Bundle 'majutsushi/tagbar'
" " Code and files fuzzy finder
" Bundle 'kien/ctrlp.vim'
" " Extension to ctrlp, for fuzzy command finder
" Bundle 'fisadev/vim-ctrlp-cmdpalette'
" " Zen coding
" Bundle 'mattn/emmet-vim'
" " Git integration
" Bundle 'motemen/git-vim'
" " Tab list panel
" Bundle 'kien/tabman.vim'
" " Airline
" Bundle 'bling/vim-airline'
" " Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" " Consoles as buffers
" Bundle 'rosenfeld/conque-term'
" " Pending tasks list
" Bundle 'fisadev/FixedTaskList.vim'
" " Surround
" Bundle 'tpope/vim-surround'
" " Autoclose
" Bundle 'Townk/vim-autoclose'
" " Indent text object
" Bundle 'michaeljsmith/vim-indent-object'
" " Python mode (indentation, doc, refactor, lints, code checking, motion and
" " operators, highlighting, run and ipdb breakpoints)
" Bundle 'klen/python-mode'
" " Better autocompletion
" Bundle 'Shougo/neocomplcache.vim'
" " Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" " Git/mercurial/others diff icons on the side of the file lines
" Bundle 'mhinz/vim-signify'
" " Automatically sort python imports
" Bundle 'fisadev/vim-isort'
" " Drag visual blocks arround
" Bundle 'fisadev/dragvisuals.vim'
" " Window chooser
" Bundle 't9md/vim-choosewin'
" " Python and other languages code checker
" Bundle 'scrooloose/syntastic'
" " Relative numbering of lines (0 is the current line)
" " (disabled by default because is very intrusive and can't be easily toggled
" " on/off. When the plugin is present, will always activate the relative
" " numbering every time you go to normal mode. Author refuses to add a
" setting
" " to avoid that)
" " Bundle 'myusuf3/numbers.vim'
"
" " Plugins from vim-scripts repos:
"
"" Search results counter
Bundle 'IndexedSearch'
"" Java autocompletion
Bundle 'javacomplete'
"" XML autocompletion
Bundle 'xml.vim'
Bundle 'Trinity'
Bundle 'taglist.vim'
Bundle 'SrcExpl'
"" Android autocompletion
"Bundle 'hsanson/vim-android'
" XML/HTML tags navigation
" Bundle 'matchit.zip'
" " Gvim colorscheme
" Bundle 'Wombat'
" " Yank history navigation
" Bundle 'YankRing.vim'
"
" "
" ============================================================================
" " Install plugins the first time vim runs
"
if iCanHazVundle == 0
     echo "Installing Bundles, please ignore key map error messages"
     echo ""
    :BundleInstall
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ts=8		" tabstop = 4
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

set enc=utf-8
set fileencoding=taiwan
set hls
set sw=8
syntax on
set nowrap
if $TERM == "vt100"
	set term=xterm-color
endif
if $TERM == "xterm"
	set term=xterm-color
endif

" highlight Comment ctermfg=darkcyan
highlight Search term=reverse ctermbg=4 ctermfg=7
" key binding
map  0
map  $

" ¦Û­q~
set background=dark
set nu
"Ignore case when searching
set ic

"map <f9> :Tlist<CR>
" Open and close the taglist.vim separately
map <f9> :TrinityToggleTagList<CR>
" Open and close the srcexpl.vim separately
map <f8> :TrinityToggleSourceExplorer<CR>
" Open and close the NERD_tree.vim separately
map <f7> :TrinityToggleNERDTree<CR>
" Open and close all the three plugins on the same time
map <f12> :TrinityToggleAll<CR>

"Let tab only move 4 space length
set softtabstop=4
set shiftwidth=4
set expandtab

"Python
let python_highlight_all=1

"Configure for 256 color
set t_Co=256
