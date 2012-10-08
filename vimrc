
set ruler
set showcmd

set nocompatible

set hidden

set backspace=2

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set number

set hlsearch

set listchars=eol:$,tab:▸\ ,trail:~,extends:>,precedes:<

set wildmode=longest:full
set wildmenu

set history=1000

set mouse=a

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

" Toggle spell mode on/off.
map <leader>p :set spell!<cr>

" toggle current column highlight shortcut
map <leader>c :set cursorcolumn!<cr>

" toggle between relative and absolute line numbers.
map <leader>r :exec "set " &nu ? "rnu": "nu"<cr>

map <leader>g :GundoToggle<CR>

" insert wd of current file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" set filetype on so we don't return a non-zero exit code due to the next line.
filetype on
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
let NERDTreeWinSize = 21

" Set tagbar option
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nnoremap <leader>l :TagbarToggle<CR>

" pep8 shortcut
nnoremap <leader>8 :call Pep8()<CR>

" let g:pyflakes_use_quickfix = 0

" mako syntax highlighting
autocmd BufRead *.mako set filetype=mako
autocmd FileType mako setlocal shiftwidth=2 tabstop=2 softtabstop=2

" jinja syntax highlighting
autocmd BufRead *.jinja set filetype=html
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2 softtabstop=2

" html indent
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

" jst syntax highlighting
autocmd BufRead *.jst set filetype=html

" Flex syntax highlighting
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

" Remove trailing white-space from python files.
autocmd BufWritePre *.py :%s/\s\+$//e


" Setup some color stuff.
set background=dark
set t_Co=256
colorscheme desert256

set cursorline
set colorcolumn=80

hi Normal guibg=#cccccc ctermbg=234
hi NonText guibg=#cccccc ctermbg=234

" highlight groups
hi CursorLine  cterm=NONE ctermbg=236
hi CursorColumn  cterm=NONE ctermbg=236
hi ColorColumn  cterm=NONE ctermbg=232



" Some stuff for dbext.
let g:dbext_default_type = 'SQLSRV'
let g:dbext_default_user = 'sa'
let g:dbext_default_srvname = 'darnbear'
let g:dbext_default_dbname = '@askkb'
let g:dbext_default_SQLSRV_bin = '/Users/bobert/tmp/pdb-test/sql-sendfile.py'
let g:dbext_default_SQLSRV_cmd_options = ' '
let g:dbext_default_SQLSRV_cmd_terminator = ' '

" Better buffer explorer.
nnoremap <C-t> :buffers<CR>:buffer<space>

" Make netrw usable as a file explorer
" Use a tre view
let g:netrw_liststyle = 3
" <cr> opens in last buffer
let g:netrw_browse_split = 4
" Vertical splits ftw
let g:netrw_preview = 1
let g:netrw_altv = 1
" Default new window size
let g:netrw_winsize = 10
" Drop the BS up top.
let g:netrw_banner = 0

function! ToggleExplorer()
    if exists("t:explorer_buffer_num")
        let explorer_window_num = bufwinnr(t:explorer_buffer_num)
        if explorer_window_num != -1
            let current_window_num = winnr()
            exec explorer_window_num . 'wincmd w'
            close
            exec current_window_num . 'wincmd w'
        endif
        unlet t:explorer_buffer_num
    else
        " goto left window
        exec '1wincmd w'
        Vexplore
        exec 'silent vertical resize 30'
        exec 'set winfixwidth'
        let t:explorer_buffer_num = bufnr("%")
    endif
endfunction

" nnoremap <leader>f :call ToggleExplorer()<CR>



let g:pygrepprg="grepp\\ -n"

function! PyGrep(args)
    let g:pyflakes_use_quickfix = 0
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:pygrepprg
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
    let g:pyflakes_use_quickfix = 1
endfunction

command! -nargs=* -complete=file G call PyGrep(<q-args>)

function! RunFile()
    let g:fileName = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute "$r!python2.5\ /Users/bobert/MyApps/WebFilings/developer-scripts/tools/py/code_runner_helper.py\ " . g:fileName
    setlocal nomodifiable
endfunction

command! -nargs=* -complete=file RC call RunFile()

function ScrollToPercent(percent)
    let movelines=winheight(0)*a:percent/100

    if has("float") && type(movelines) == type(0.0)
        let movelines=float2nr(movelines)
    endif

    let oldso=&so
    execute ":set so=" . movelines
    execute "normal! zt"
    execute ":set so=" . oldso
endfunction

nnoremap za :<C-u>call ScrollToPercent(20)<cr>

