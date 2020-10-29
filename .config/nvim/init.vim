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

"REPL Settings
" call repl#define_repl('python', {
" 			\	'bin': 'ipython',
" 			\	'args': [],
" 			\	'syntax': '',
" 			\	'title': 'Python',
" 			\	}, 'force')
" let g:repl_input_symbols = {
"             \   'python': ['>>>', '>>>>', 'ipdb>', 'pdb', '...'],
"             \   'scala': ['@']
"             \   }
" let g:sendtorepl_invoke_key = "<leader><leader>m"
" let g:repl_ipython_version = '6'
" " Send the text of a motion to the REPL
" nmap <leader><leader>q :Repl<cr>
" nmap <leader><leader>rs  <Plug>(ReplSend)
" " Send the current line to the REPL
" nmap <leader>rss <Plug>(ReplSendLine)
" nmap <leader>rs_ <Plug>(ReplSendLine)
" " Send the selected text to the REPL
" vmap <leader><leader>rs  <Plug>(ReplSend)