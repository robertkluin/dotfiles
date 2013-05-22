
set nocompatible

set ruler
set showcmd

set laststatus=2

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

" Do not search pyc files.
set wildignore+=*.pyc

set history=1000

set mouse=a

" Backup files
set backup
set backupdir=~/tmp/vim/backup//

" Put undo files in a special safe place.
set undofile
set undodir=~/tmp/vim/undo//

" Put swap files in a special place.
set directory=~/tmp/vim/swap//


let g:pymode_folding=0
let g:pymode_lint_ignore = "W391"
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_run = 0

let python_highlight_all=1


" Fix Y to work like other Caps, such as D.
nnoremap Y y$

" Make shell commands run like they normally would
" NOTE: This really hoses up vim-fugitive.
" set shellcmdflag=-ic

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
map <leader>p :set spell!<cr>:set spell?<cr>

" toggle current column highlight shortcut.
map <leader>c :set cursorcolumn!<cr>

" toggle between relative and absolute line numbers.
map <leader>r :exec "set " &nu ? "rnu": "nu"<cr>

" toggle paste mode.
map <leader>e :set paste!<CR>

" toggle gundo on/off.
map <leader>g :GundoToggle<CR>

" insert wd of current file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" set filetype on so we don't return a non-zero exit code due to the next line.
filetype on
" filetype being on breaks pathogen
filetype off

" startup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jnwhiteh/vim-golang'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-fugitive.git'
Bundle 'robertkluin/vim-handy-highlights.git'
Bundle 'airblade/vim-gitgutter'
Bundle 'jnurmine/Zenburn'

" Enable filetype plugins
syntax on
filetype plugin indent on

" tweak nerd tree
"nnoremap <leader>f :NERDTreeToggle<CR><C-w>=
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeWinSize = 22
let NERDTreeMinimalUI = 1

" Flake8 setup and shortcut
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=W391'
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap zj :lnext<CR>zz
nnoremap zk :lprev<CR>zz

" mako syntax highlighting
autocmd BufRead *.mako set filetype=mako

" make jinja, jst, and handlebars templates use html syntax highlighting
autocmd BufRead *.jinja,*.jst,*.handlebars set filetype=html

" Set html, coffee, and javascript indent depths to 2-space.
autocmd FileType coffee,html,javascript,mako setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Flex syntax highlighting
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

" Remove trailing white-space from python files.
autocmd BufWritePre *.py :%s/\s\+$//e

" Turn spellcheck on for gitcommit by default.
autocmd FileType gitcommit set spell

" Setup some color stuff.
set background=dark
set t_Co=256
"colorscheme desert256
colorscheme zenburn

set cursorline
set colorcolumn=80

" Set background color
" hi Normal guibg=#cccccc ctermbg=234
" hi NonText guibg=#cccccc ctermbg=234
hi Normal ctermbg=235
hi NonText ctermbg=235
hi Statement ctermbg=235
hi Visual ctermbg=60
hi StatusLine ctermfg=246 ctermbg=234
hi StatusLineNC ctermfg=238 ctermbg=187
hi Todo ctermfg=30
hi Exception ctermfg=187 ctermbg=235

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

" Hide crap that I don't want to see.
let g:netrw_list_hide= '^\..*$,^.*\.pyc$'

function! ToggleExplorer()
    if exists("t:explorer_buffer_num")
        let explorer_window_num = bufwinnr(t:explorer_buffer_num)
        if explorer_window_num != -1
            let current_window_num = winnr()
            exec explorer_window_num . 'wincmd w'
            close
            exec current_window_num . 'wincmd w'
            exec 'wincmd ='
        endif
        unlet t:explorer_buffer_num
    else
        " goto left window
        exec '1wincmd w'
        Vexplore
        exec 'silent vertical resize 22'
        exec 'set winfixwidth'
        exec 'wincmd ='
        let t:explorer_buffer_num = bufnr("%")
    endif
endfunction

nnoremap <leader>f :call ToggleExplorer()<CR>



let g:pygrepprg="grepp\\ -n"

function! PyGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:pygrepprg
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

command! -nargs=* -complete=file G call PyGrep(<q-args>)

function! RunFile()
    let g:fileName = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute "$r!python2.5\ /Users/bobert/code/WebFilings/developer-scripts/tools/py/code_runner_helper.py\ " . g:fileName
    setlocal nomodifiable
endfunction

command! -nargs=* -complete=file RC call RunFile()

function! ScrollToPercent(percent)
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



function! ZoomMode(enable)
    if a:enable
        " If zoom mode is one, make windows a size usable for coding as we jump
        " between them.
        set winwidth=84

        " We have to have a winheight bigger than we want to set winminheight. But
        " if we set winheight to be huge before winminheight, the winminheight set
        " will fail.
        set winheight=15
        set winminheight=15
        set winheight=999
    else
        " If zoom mode is not on, set resize limits much lower.
        set winwidth=20
        set winheight=15
        set winminheight=1
        set winheight=1
    endif
endfunction

function! RunTests()
    " I can not decide if I like auto-save or not.  For now, not.
    "execute ":w"

    if exists('w:test_command')
        let l:command = w:test_command
    else
        let l:command = g:run_test_command
    endif

    exec ":silent !tmux send-keys -t " . g:run_test_target . " '" . l:command . "' 'C-m'"

    execute ":redraw!"
endfunction

let g:run_test_target = "+1"
let g:run_test_command = '\!\!'
"let g:run_test_command = "make unit"

nmap <leader>t :call RunTests()<CR>
