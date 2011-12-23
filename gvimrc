" Highlight current cursor line and col 80.
set cursorline
set colorcolumn=80

" Set font.
set gfn=Menlo\ Regular:h12

" No menubar.
set guioptions-=T

" Setup command-T mappings
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

