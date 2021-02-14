syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'mbbill/undotree'
Plug 'https://github.com/jpalardy/vim-slime.git'
call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:slime_target = "tmux"

let mapleader = " "
"let g:netrw_browse_split = 4
let g:netrw_banner = 0
"let g:netrw_winsize = 25
let g:netrw_local_rmdir='rm -r'

let g:ctrlp_use_caching = 0

colorscheme gruvbox
set background=dark

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>ps :Rg<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>gd :YcmCompleter GoTo<CR>





