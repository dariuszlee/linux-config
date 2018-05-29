source ~/.vim/plugins.vim

" Spacing
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab

" Line numbering
set number
set numberwidth=1

" Config
let mapleader = ","
nnoremap <leader><leader>r :source ~/.vimrc<CR>
nnoremap <leader><leader>t :e ~/.vimrc<CR>
nnoremap <leader><leader>y :e ~/.vim/plugins.vim<CR>

syntax on
colorscheme desert

" lightline
set laststatus=2

" fzf
nnoremap ; :Files<CR>
nnoremap <leader>; :Buffers<CR>

" Term shortcuts
nnoremap <leader>t :call term_start("zsh", { "vertical":1 })<CR>
