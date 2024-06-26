set nocompatible  " Make Vim more useful.

set modeline      " Use modlines?
set modelines=1   " Use modlines?

" Layout / window stuff {{{
set laststatus=2  " Always show the status line.
set ruler         " Show the line coordinates and file position in status line.
set showcmd       " Show the last command typed in the status line.
set number        " Why is this even an option?  (show line numbers).
set nowrap        " Do not visual word wrap lines.

set hidden        " Buffers remain in memory when not attached.

set cursorline    " Highlight the line the cursor is on.
set colorcolumn=80 " Put a bar down column 80.

set signcolumn=yes " It is wildly jarring when this toggles otherwise

" }}}

set backspace=indent,eol,start  " What should BS do?

set history=1000

set mouse=a

" Indenting and tabs {{{
set autoindent     " Preserve indenting when starting new line.

set expandtab      " Use spaces, rather than tab char.
set tabstop=4      " How many spaces should be used for tab?
set shiftwidth=4   " Number of spaces for (auto)indent.
set softtabstop=4  " Number of spaces tab counts for.

"}}}

" Searching {{{
set noincsearch    " Disable incremental search
set hlsearch       " Highlight search matches.

" }}}

" How to display assorted non-printing chars
set listchars=eol:$,tab:▸\ ,trail:~,extends:>,precedes:<

set wildmode=longest:full  " Autocomplete longest possible common segment.
set wildmenu               " Show an auto-complete list.
set wildignore+=*.pyc      " Do not autocomplete pyc files.
set wildignorecase         " Ignore case in path completion.

" Autocomplete is basically unusable (for me) when set to scan for included
" files.
set complete=.,w,b,u,t     " Default '.,w,b,u,t,i'; The i says included files.

" Backup files {{{
set backup
set backupdir=~/tmp/vim/backup//
set backupskip=/tmp/*,~/tmp/*
set writebackup

" Put undo files in a special safe place.
set undofile
set undodir=~/tmp/vim/undo//

" Put swap files in a special place.
set directory=~/tmp/vim/swap//

"}}}

" Key Bindings {{{

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
" nnoremap <C-x> <C-w>x

" jj as shortcut for escape
noremap! jj <Esc>

" ;; for find next inline.
nnoremap ;; ;

" ,, for find previous inline.
nnoremap ,, ,

" ; for cmd-mode entry
nnoremap ; :

" Better buffer explorer.
nnoremap <C-t> :buffers<CR>:buffer<space>

"}}}

" Leader Mappings {{{
" remap leader from \
let mapleader = ","

" cancel highlight shortcut
map <leader><cr> :noh<cr>

" Toggle spell mode on/off.
map <leader>p :set spell!<cr>:set spell?<cr>

" toggle current column highlight shortcut.
map <leader>c :set cursorcolumn!<cr>:set cursorcolumn?<cr>

" toggle between relative and absolute line numbers.
map <leader>r :set rnu!<cr>:set rnu?<cr>

" toggle paste mode.
map <leader>e :set paste!<cr>:set paste?<cr>

" toggle gundo on/off.
map <leader>g :GundoToggle<CR>

" Toggle hidden chars.
map <leader>l :set list!<cr>

" Sort
map <leader>s :sort<cr>

"}}}

" insert wd of current file.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" plug.vim {{{
"
"
call plug#begin('~/.vim/plugged')

Plug 'sjl/gundo.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"}}}

" Enable filetype plugins
filetype plugin indent on
syntax on
set re=0

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd BufWrite *.py call CocActionAsync('format')
autocmd FileType python nnoremap <silent> <buffer> <leader>T :sfind test_%:t

" Spell check in git commits
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

" Spell check in Markdown files
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell

" Fix Silly Plugins {{{

" Tell gundo to prefer python3
let g:gundo_prefer_python3 = 1

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nnoremap zj :lnext<CR>zz
" nnoremap zk :lprev<CR>zz

" " Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Map keys for doc helpers
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Create mappings for function text object, requires document symbols feature
" of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"}}}

" Make Colors More Nicer {{{

set background=dark
set t_Co=256


" Hmmmm. This sucks
" let g:gruvbox_guisp_fallback = "bg"

colorscheme gruvbox

" Toggle high-contrast mode on/of
function! ToggleContrast()
    if !exists('g:current_contrast')
        let g:current_contrast = 0
    endif

    if g:current_contrast < 0
        let g:gruvbox_contrast_dark = 'medium'
        let g:current_contrast = 0
        echo "  medium contrast mode"
    elseif g:current_contrast == 0
        let g:gruvbox_contrast_dark = 'hard'
        let g:current_contrast = 1
        echo "  hard contrast mode"
    else
        let g:gruvbox_contrast_dark = 'soft'
        let g:current_contrast = -1
        echo "  soft contrast mode"
    endif

    colorscheme gruvbox
endfunction

map <leader>h :call ToggleContrast()<cr>

"}}}


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



function! ZoomMode()
    if !exists("t:zoom_mode_enabled")
        echo "  zoommode"

        " If zoom mode is on, make windows a size usable for coding as we jump
        " between them.
        set winwidth=84

        " We have to have a winheight bigger than we want to set winminheight.
        " But if we set winheight to be huge before winminheight, the
        " winminheight set will fail.
        set winheight=15
        set winminheight=15
        set winheight=999

        " Mark ZoomMode as currently on.
        let t:zoom_mode_enabled = 1
    else
        echo "nozoommode"

        " If zoom mode is not on, set resize limits much lower.
        set winwidth=20
        set winheight=15
        set winminheight=1
        set winheight=1

        " Make sure zoom mode marked as off.
        unlet t:zoom_mode_enabled
    endif
endfunction

silent! call ZoomMode()

" Toggle zoom mode on/off.
map <leader>z :call ZoomMode()<cr>

function! ExecTmuxCommand()
    " I can not decide if I like auto-save or not.  For now, not.
    "execute ":w"

    if exists('b:exec_command')
        let l:command = b:exec_command
    elseif exists('w:exec_command')
        let l:command = w:exec_command
    else
        let l:command = g:exec_command
    endif

    if exists('b:exec_target')
        let l:target = b:exec_target
    elseif exists('w:exec_target')
        let l:target = w:exec_target
    else
        let l:target = g:exec_target
    endif

    call SendTmuxCommands(l:target, l:command)
endfunction

function! SendTmuxCommands(...)
    for pair in range(0, a:0 - 2, 2)
        let l:target = a:{pair + 1}
        let l:command = a:{pair + 2}
        exec ":silent !tmux send-keys -t " . l:target . " '" . l:command . "' Enter Enter"
    endfor
    execute ":redraw!"
endfunction

let g:exec_target = "+1"
let g:exec_command = '\!\!'

nmap <leader>t :call ExecTmuxCommand()<CR>


" vim:foldmethod=marker:foldlevel=0
