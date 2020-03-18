set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

tnoremap <C-n> <C-\><C-n>

nnoremap <leader><leader>r :source ~/.config/nvim/init.vim<CR>