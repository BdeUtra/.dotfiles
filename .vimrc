" anything here that doesn't have a detailed enough explanation for you, then
" you need to learn the magic of :help <anything you want to know>

set nocompatible " so Vi (the precursor to Vim) is pretty bad, we don't want that.
set viewoptions=cursor,folds,slash,unix

filetype off "don't delete from here...

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python3_host_skip_check = 1

filetype plugin indent on "load file type plugins + indentation
"
" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tmhedberg/SimpylFold'
" Plug 'davidhalter/jedi-vim'

Plug 'vim-scripts/twilight256.vim'
Plug 'junegunn/seoul256.vim'
Plug 'nightsense/cosmic_latte'

Plug 'elzr/vim-json'
Plug 'tpope/vim-git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'lepture/vim-jinja'
Plug 'junegunn/fzf' , { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-sensible'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ambv/black'
Plug 'kopischke/vim-stay'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'lifepillar/vim-solarized8'
Plug 'iCyMind/NeoSolarized'
Plug 'AlessandroYorba/Sierra'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
call plug#end()

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

if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
    set notermguicolors
elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
    set termguicolors
elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
    if $XTERM_VERSION != ''
        set termguicolors
    elseif $KONSOLE_PROFILE_NAME != ''
        set termguicolors
    elseif $VTE_VERSION != ''
        set termguicolors
    else
        set notermguicolors
    endif
endif
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"general settings


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

syntax enable

" COLOURS

set termguicolors
" set t_Co=256
" set background=light
set background=dark

"seoul256
let g:seoul256_background = 235
colorscheme seoul256

" cosmic_latte
" colorscheme cosmic_latte

" lightline {{{
    " let g:lightline = {'colorscheme': 'cosmic_latte_light'}
    let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" disabling showmode as mode already displayed on lightline
set noshowmode
" }}}


" completion
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

"set filetypes

"set tab stops based on file type
autocmd Filetype html,htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript,ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype css,scss setlocal ts=2 sts=2 sw=2
autocmd Filetype vim setlocal ts=2 sts=2 sw=2
autocmd Filetype conf,terraform,yaml,yml setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=8 sts=8 sw=8

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
set noswapfile

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
" if executable('ag')
" " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$"'

" " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" else
" " Fall back to using git ls-files if Ag is not available
"   let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
" endif
" " search in .git/.hg if it exists, else the current working directory.
" " (default is 'ra' which also searches in parent of current file, rarely
" " what you want, especially if you're editing ~/.vimrc or browsing help)
" let g:ctrlp_working_path_mode = 'r'
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" fzf
" let g:fzf_command_prefix = 'Ag'
" nnoremap <C-p> :Ag . --files-with-matches -g "" --ignore ~/.ignore "<CR>
" nnoremap <C-p> :call fzf#run(fzf#wrap())<ENTER>
"
nnoremap <C-p> :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<Enter>
nnoremap <C-f> :Buffers<CR>
nnoremap <C-s> :Lines<CR>
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

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
nnoremap <leader>et :vsp ~/.todo<CR>

" jedi-vim {
       " let g:jedi#auto_vim_configuration = 0
       " let g:jedi#popup_on_dot = 0
       " let g:jedi#popup_select_first = 0
       " let g:jedi#completions_enabled = 0
       " let g:jedi#completions_command = ""
       " let g:jedi#show_call_signatures = "1"

       " let g:jedi#goto_assignments_command = "<leader>pa"
       " let g:jedi#goto_definitions_command = "<leader>pd"
       " let g:jedi#documentation_command = "<leader>pk"
       " let g:jedi#usages_command = "<leader>pu"
       " let g:jedi#rename_command = "<leader>pr"
   " }

" strip trailing whitespace before saving {
    autocmd BufWritePre *.py :%s/\s\+$//e
"}

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

let python_highlight_all=1

" let g:ycm_path_to_python_interpreter="/opt/local/bin/python"

" incsearch
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1

" resize vim splits
nnoremap Ó <c-w>5<
nnoremap Ò <c-w>5>
nnoremap  <c-w>5+
nnoremap Ô <c-w>5-

" vim test
let test#strategy = "neovim"
let test#python#runner = 'pytest'
let test#python#pytest#options = {
  \ 'nearest': '-svvvv',
  \ 'file':    '-sv',
  \ 'suite':   '-sv',
\}
let test#go#gotest#options = {
  \ 'nearest': '-v',
  \ 'file': '-v',
  \ 'suite': '-v',
\}
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" nvim completion manager
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ALE linting
" Check Python files with flake8 and pylint.
let g:ale_completion_enabled = 1
highlight ALEErrorSign ctermfg=9
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ 'python': ['flake8', 'mypy', 'pyls'] ,
  \ }
" let g:ale_python_pyls_use_global=1
let g:ale_python_flake8_options="--ignore=E501,E203,E225,E226,E265,I100,I101,I201"
let g:ale_python_mypy_options = '--ignore-missing-imports --line-length=120'
let g:ale_python_auto_pipenv = 1
let g:ale_python_auto_poetry = 1
let g:ale_python_pyls_config = {
\   'pyls': {
\     'plugins': {
\       'pycodestyle': {
\         'enabled': v:false
\       },
\     }
\   },
\ }
" Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['autopep8', 'yapf']
"
autocmd FileType python nmap <leader>gd :ALEGoToDefinition<CR>
autocmd FileType python nmap <leader>pd :ALEGoToDefinitionInVSplit<CR>
autocmd FileType python nmap <leader>ppd :ALEGoToDefinitionInSplit<CR>
autocmd FileType python nmap <leader>fr :ALEFindReferences<CR>

" Black
autocmd FileType python nmap <leader>b :Black<CR>

inoremap jj <ESC>:w<CR>

" Jump between syntax errors
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

" vim go
" set foldmethod=syntax
" let g:go_fold_enable = 1
" let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_auto_type_info = 1

autocmd FileType go nmap tt  <Plug>(go-alternate-edit)
autocmd FileType go nmap tv  <Plug>(go-alternate-vertical)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test-func)
autocmd FileType go nmap <leader>a  <Plug>(go-test)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
"
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" to speed up scrolling on go files
set nocursorcolumn
syntax sync minlines=256
" set re=1
"
" helm yaml filetype
autocmd BufRead,BufNewFile *yaml.gotmpl set filetype=yaml
