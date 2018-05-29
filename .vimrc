" Additional sourcing
source ~/.vim/plugins.vim " Plugins

" Tabbing config
syntax on
set tabstop=4
set shiftwidth=4

" Status line config
set laststatus=2

" Color scheme config
colorscheme gruvbox
set background=dark " Dark Mode

" Vim config hot keys
let mapleader = ","
nnoremap <Leader><Leader>r :source ~/.vimrc<CR>
nnoremap <Leader><Leader>t :edit ~/.vimrc<CR>
nnoremap <Leader><Leader>y :edit ~/.vim/plugins.vim<CR>

" fzf Hot keys
nnoremap ; :Files<CR>
nnoremap <Leader>; :Buffers<CR>
