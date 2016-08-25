" anything here that doesn't have a detailed enough explanation for you, then
" you need to learn the magic of :help <anything you want to know>

set nocompatible " so Vi (the precursor to Vim) is pretty bad, we don't want that.

filetype off "don't delete from here...

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
"Plugin 'jpythonfold.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'The-NERD-Commenter'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'junegunn/seoul256.vim'
"Plugin 'nvie/vim-flake8'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-git'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'chase/vim-ansible-yaml'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'haya14busa/incsearch.vim'
call vundle#end()

filetype plugin indent on "load file type plugins + indentation

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
let g:seoul256_background = 235
colorscheme seoul256

"sanity settings
set backspace=indent,eol,start " backspace through everything in insert mode
set scrolloff=3 "the number of lines before the end of the window.
set showmode "don't remember what this does
set showcmd "display incomplete commands
set hidden "lets you navigate away from buffer with unsaved changes
set encoding=utf-8 "because foreigners happened
set wildmenu "this changes things in the ':' menu, you'll like it.
set wildmode=longest:full,full
set visualbell "as in not audiobell that is basically a bell... ANNOYING!
set ttyfast "terminals are now fast, wow!
set undofile "saves an undo file
set cmdheight=2
set nowrap

"sane search settings
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"this makes <Tab> make sense
"set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"set filetypes

"set tab stops based on file type
autocmd Filetype html,htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript,ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype css,scss setlocal ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml,yml setlocal ts=2 sts=2 sw=2

" line numbers
" set relativenumber
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
set backupcopy=yes                " enable --watch devservers to catch :w
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

" ctrlp
if executable('ag')
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$"'

" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
" Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif
" search in .git/.hg if it exists, else the current working directory.
" (default is 'ra' which also searches in parent of current file, rarely
" what you want, especially if you're editing ~/.vimrc or browsing help)
let g:ctrlp_working_path_mode = 'r'

nnoremap <C-p> :CtrlP<CR>
nnoremap <C-f> :CtrlPBuffer<CR>

" toggling
nnoremap <Space> za

" GitGutter colors
highlight clear SignColumn
highlight GitGutterAdd ctermbg=235          " an added line
highlight GitGutterChange ctermbg=235       " a changed line
highlight GitGutterDelete ctermbg=235       " at least one removed line
highlight GitGutterChangeDelete ctermbg=235 " a changed line followed by at least one removed line
" GitGutter config
let g:gitgutter_realtime=1

" Maps
let mapleader = ","

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"autocmd jpython
"autocmd FileType python source ~/.vim/bundle/jpythonfold.vim/syntax/jpythonfold.vim"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1

" jedi-vim {
       let g:jedi#auto_vim_configuration = 0
       let g:jedi#popup_on_dot = 0
       let g:jedi#popup_select_first = 0
       let g:jedi#completions_enabled = 0
       let g:jedi#completions_command = ""
       let g:jedi#show_call_signatures = "1"

       let g:jedi#goto_assignments_command = "<leader>pa"
       let g:jedi#goto_definitions_command = "<leader>pd"
       let g:jedi#documentation_command = "<leader>pk"
       let g:jedi#usages_command = "<leader>pu"
       let g:jedi#rename_command = "<leader>pr"
   " }

" vim-flake8 {
"    autocmd BufWritePost *.py call Flake8()
"    let g:flake8_max_complexity=10
"    let g:flake8_max_line_length=99
"    let g:flake8_quickfix_location="topleft"
"}

" syntastic {
    let g:syntastic_python_checkers = ['flake8']
    let g:syntastic_python_flake8_args='--ignore=E501,E225,E226,E265,I100,I101,I201'
"}

" strip trailing whitespace before saving {
    autocmd BufWritePre *.py :%s/\s\+$//e
"}
" lightline {{{
    let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ }
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
" }}}
"
""reselect indented block
vnoremap < <V`]
vnoremap > >V`]


" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f ! -name '*.pyc'", "", ":e")<cr>

" Delete trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python,htmldjango,html,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" VertSplit column as background
hi VertSplit ctermbg=235 ctermfg=235

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1

let g:ycm_path_to_python_interpreter="/opt/local/bin/python"

" incsearch
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1

" resize vim splits
nnoremap Ó <c-w>5>
nnoremap Ò <c-w>5<
nnoremap  <c-w>5+
nnoremap Ô <c-w>5-

" run tests
" run all tests
nnoremap <leader>a :!./activate.sh dev fab test_new<CR>
" run only tests on focused file
nnoremap <leader>t :!./activate.sh dev py.test -sv %<CR>
