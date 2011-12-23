
set ruler
set showcmd

set nocompatible

set hidden

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set number

set hlsearch

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set wildmode=longest:full
set wildmenu

set history=1000

let python_highlight_all=1

" Make shell commands run like they normally would
set shellcmdflag=-ic

" Remap window nav to ctrl-[h,j,k,l]
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>x

" jj as shortcut for escape
noremap! jj <Esc>

" ;; for find next inline.
nnoremap ;; ;

" ,, for find previous inline.
nnoremap ,, ,

" ; for cmd-mode entry
nnoremap ; :

" remap leader from \
let mapleader = ","

" cancel highlight shortcut
map <leader><cr> :noh<cr>

" toggle current column highlight shortcut
map <leader>c :set cursorcolumn!<cr>

color desert

" filetype being on breaks pathogen
filetype off

" startup pathogen
call pathogen#infect()
call pathogen#helptags()

" Enable filetype plugins
syntax on
filetype plugin indent on

" tweak nerd tree
nnoremap <leader>f :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Set tagbar option
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nnoremap <leader>l :TagbarToggle<CR>

" pep8 shortcut
nnoremap <leader>8 :call Pep8()<CR>

" Remove trailing white-space from python files.
autocmd BufWritePre *.py :%s/\s\+$//e

" Some stuff for dbext.
let g:dbext_default_type = 'SQLSRV'
let g:dbext_default_user = 'sa'
let g:dbext_default_srvname = 'darnbear'
let g:dbext_default_dbname = '@askkb'
let g:dbext_default_SQLSRV_bin = '/Users/bobert/tmp/pdb-test/sql-sendfile.py'
let g:dbext_default_SQLSRV_cmd_options = ' '
let g:dbext_default_SQLSRV_cmd_terminator = ' '
