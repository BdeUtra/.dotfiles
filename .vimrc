" welcome to your vimrc, there are many like it, but this one is yours.
" the idea here is we give you a basic vimrc that makes vim behave in a
" vaguely rational way, without forcing anyone into a specific useage pattern.
" half the fun is working out what works for you and what doesn't!
" however alot of the stuff in this base file is highly unlikely to change
" anything here that doesn't have a detailed enough explanation for you, then
" you need to learn the magic of :help <anything you want to know>


" VUNDLE
" this is a pretty stronk package manager for vim, you will see a few others
" mentioned such as pathogen or vim-addon-manager, they do basically the same
" thing. you should read this if you want to install plugins or scripts etc:
" https://github.com/gmarik/Vundle.vim
set nocompatible " so Vi (the precursor to Vim) is pretty bad, we don't want that.

filetype off "don't delete from here...

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" below are some plugins to make your life easier. uncomment and :BundleInstall
" when you feel brave enough. they are all pretty frickin usefull.

"Plugin 'airblade/vim-gitgutter'
"Plugin 'itchyny/lightline.vim'
"Plugin 'jpythonfold.vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'

filetype plugin indent on " ....to here.

" Get running OS
let os = ""
if has("win32")
  let os="win"
else
  if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
      let os="mac"
    else
      let os="unix"
    endif
  endif
endif

"general settings
syntax enable
set t_Co=256
set background=dark
"colorscheme <hybrid|solarized|etc> set this to your prefered color scheme

"sanity settings
set backspace=indent,eol,start "makes backspacing non retarded
set scrolloff=3 "the number of lines before the end of the window.
set showmode "don't remember what this does
set hidden "lets you navigate away from buffer with unsaved changes
set encoding=utf-8 "because foreigners happened
set wildmenu "this changes things in the ':' menu, you'll like it.
set wildmode=longest:full,full
set visualbell "as in not audiobell that is basically a bell... ANNOYING!
set ttyfast "terminals are now fast, wow!
set undofile "saves an undo file

"sane search settings
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"this makes <Tab> make sense
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" line numbers
set relativenumber
set number

"mouse and things
set mouse=a
map <ScrollWheelUp> 3<C-Y>
map <ScrollWheelDown> 3<C-E>

" Pawel says this is important
noremap Q <nop>

"status line
set laststatus=2

" so stock vim does silly thing that you don't want. load this up (twice)
" never think about it again.
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
   call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
   call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
   call mkdir(expand(&directory), "p")
endif

"auto set clipboard
set clipboard=unnamed
if os == 'unix'
    set clipboard=unnamedplus
endif

