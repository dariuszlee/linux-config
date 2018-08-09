source ~/.vim/plugins.vim

set encoding=utf-8
" Spacing
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab

" Line numbering
set number
set numberwidth=1

" Etc configs
set number          " Show line numbers                   
set wildmenu        " Show auto complete suggestions  
set showmatch       " Show surrounding match          
                                                      
set incsearch       " search as characters entered    
set hlsearch        " Highligh search matches         

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
let g:gruvbox_termcolors = '256'
let g:gruvbox_contrast_dark = 'hard'
set background=dark " Dark Mode

" fzf
" let $FZF_DEFAULT_COMMAND='git ls-tree -r --name-only HEAD'
nnoremap ; :Files<CR>
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>l :Tags<CR>
nnoremap <leader>bl :BTags<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>c :Commit<CR>
nnoremap <leader>bc :BCommit<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <Leader>g :Rg <c-r>=expand("<cword>")<CR><CR>
command! -nargs=1 Rg call fzf#vim#grep('rg --column --line-number --color=always --smart-case '.<q-args>, 1)

" Term shortcuts
nnoremap <leader>v :call term_start("zsh", { "vertical":1 })<CR>
nnoremap <leader>b :call term_start("zsh")<CR>

" Tab Bar shortcut
nnoremap <leader>t :TagbarToggle<CR>
" Default browser
let g:open_url_browser_default = "vivaldi-stable"

" Source file
nnoremap <leader>s :source %<CR>

function! CheckIfGit()
	:0r! git rev-parse --git-dir
	if v:shell_error != 0
		echom "Not a git repo"
		return 0
	else
		let s:cmdOut = getline(0,1)
		let s:isThisDir = matchstr(s:cmdOut[0], '^.git$')
		let s:isHomeDir = matchstr(s:cmdOut[0], '/home/\a\+/.git$')
		echo s:isHomeDir
		echo len(s:isHomeDir)
		echo len(s:isThisDir)

		if len(s:isHomeDir) != 0
			echom "Home directory repo"
			return 1
		elseif len(s:isThisDir) != 0
			echom "We are at the root of the repo: ".getcwd()
			return 2
		else
			echom "We are in a git repo who's root is ".s:cmdOut[0]
			return 2
		endif
	endif
endfunction

function! SetFzfDefault()
	:new
	let l:isGit = CheckIfGit()
	:q!
	if l:isGit == 0 || l:isGit == 1
		let $FZF_DEFAULT_COMMAND = 'find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
	elseif l:isGit == 2
		let $FZF_DEFAULT_COMMAND = 'git ls-tree -r --name-only HEAD'
	else
		echom "Case not handled at the moment. Read CheckIfGit()"
	endif
endfunction

" SET FZF 
silent call SetFzfDefault()
