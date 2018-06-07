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

" Auto complete
"" VimCompletesMe
let b:vcm_tab_complete = "omni"
set completeopt=longest,menuone
set omnifunc=csscomplete#CompleteCSS " CSS obvs

" Syntax
syntax on

" lightline
set laststatus=2

" Color scheme config
colorscheme gruvbox
set background=dark " Dark Mode

" fzf
nnoremap ; :Files<CR>
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>l :Tags<CR>
nnoremap <leader>bl :BTags<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>c :Commit<CR>
nnoremap <leader>bc :BCommit<CR>

" Term shortcuts
nnoremap <leader>t :call term_start("zsh", { "vertical":1 })<CR>

" Default browser
let g:open_url_browser_default = "vivaldi-stable"
