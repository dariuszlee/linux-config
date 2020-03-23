set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

tnoremap <C-n> <C-\><C-n>
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>j <C-\><C-n><C-w>j

set scrollback=100000

nnoremap <leader><leader>r :source ~/.config/nvim/init.vim<CR>