set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Language Specific
"" GO
Plugin 'fatih/vim-go'

" REPL
Plugin 'sillybun/vim-repl'
 
"" Python
Plugin 'python-mode/python-mode'
Plugin 'tmhedberg/SimpylFold'
Plugin 'szymonmaszke/vimpyter'

" Plugin 'tmhedberg/SimpylFold'
" Plugin 'davidhalter/jedi-vim'

" Scala
Plugin 'derekwyatt/vim-scala'

" Complete Engine
Plugin 'ajh17/VimCompletesMe'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Snippets
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'

" html/css
Plugin 'mattn/emmet-vim'

" Fuzzy
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" Ctags/Tag relavant stuff
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'

" File formatting
Plugin 'maksimr/vim-jsbeautify'

" Lightline
Plugin 'itchyny/lightline.vim'
" Syntax
" Plugin 'w0rp/ale'
" Color schemes
Plugin 'morhetz/gruvbox'
" Open url
Plugin 'dhruvasagar/vim-open-url'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin '1995eaton/vim-better-javascript-completion'

" Json
Plugin 'elzr/vim-json'

" Project Vimrc
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'

" File system
Plugin 'scrooloose/nerdtree'

" Folding
Plugin 'pseewald/vim-anyfold'
" Hex????
Plugin 'fidian/hexmode'

" Personal Plugins
Plugin 'dariuszlee/vim-dzl-replace'
Plugin 'dariuszlee/vim-dzl-gitdiff'

call vundle#end()            " required

filetype plugin indent on    " required
let g:deoplete#enable_at_startup = 1
"source ~/.vim/plugins.vim

" Color scheme config
colorscheme gruvbox
let g:gruvbox_termcolors = '256'
let g:gruvbox_contrast_dark = 'hard'
set background=dark " Dark Mode
highlight Normal ctermbg=none

imap jj <Esc>

set encoding=utf-8

" Spacing
set tabstop=4
set shiftwidth=4
set expandtab

" Project specific vim
" set exrc
" set secure

" Line numbering
set number
set numberwidth=1

" Etc configs
set number          " Show line numbers                   
set wildmenu        " Show auto complete suggestions  
set showmatch       " Show surrounding match          
                                                      
set incsearch       " search as characters entered    
set hlsearch        " Highligh search matches         

" Terminal scroll back size
set termwinscroll=1000000

"REPL Settings
let g:repl_program = {
			\	'python': 'ipython',
			\	'default': 'zsh',
            \   'scala': 'amm'
			\	}
let g:repl_input_symbols = {
            \   'python': ['>>>', '>>>>', 'ipdb>', 'pdb', '...'],
            \   'scala': ['@']
            \   }
let g:sendtorepl_invoke_key = "<leader><leader>m"
let g:repl_ipython_version = '6'
nnoremap <leader><leader>q :REPLToggle<Cr>
nnoremap <leader>h :REPLHide<Cr>
nnoremap <leader>u :REPLUnhide<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>

" GutenTags commands
let g:gutentags_define_advanced_commands=1

" Snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/dar-snippets', "UltiSnips"]
nnoremap <leader><leader>us :sp ~/.vim/bundle/vim-snippets/snippets/
nnoremap <leader><leader>uu :sp ~/.vim/dar-snippets/

" pynb
autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

" Hexmode
nnoremap <leader>hm :Hexmode<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" URL Encode/decode selection
vnoremap <leader>en :!python -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'<cr>
vnoremap <leader>de :!python -c 'import sys,urllib;print urllib.unquote(sys.stdin.read().strip())'<cr>

" Json Encode
nnoremap <leader>js :call JsonBeautify()<CR>

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

" Snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-d>"

" Handling swap files
augroup SwapFileGroup
    autocmd!
    autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END

" git hotkeys
nnoremap <leader>gd :GitDiff<CR>
nnoremap <leader>go :GitDiff 

nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>

" Syntax
syntax on

" Tab Movement helpers
nnoremap <leader><leader>c :q!<CR>
nnoremap <leader>n :tabn 
nnoremap <leader>tc :tabc<CR>

" Pymode
let g:pymode_python = 'python3'
filetype plugin on
filetype indent on
nnoremap <leader>pl :PymodeLintToggle<CR>
" Linters
let g:pymode_lint_options_pep8 = {'ignore': ["E3", "E2", "E5"]}

" lightline
set laststatus=2

" Fugitive
nnoremap <leader><leader>g :Gstatus<CR>

" Turn on diff
nnoremap <leader>d :windo diffthis<CR>
nnoremap <leader>e :windo diffoff<CR>

" fzf
" let $FZF_DEFAULT_COMMAND='git ls-tree -r --name-only HEAD'
nnoremap ; :Files<CR>
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>l :Tags<CR>
nnoremap <Leader><leader>l :Tags <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>bl :BTags<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>c :Commit<CR>
nnoremap <leader>bc :BCommit<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <Leader>a :Rg <c-r>=expand("<cword>")<CR><CR>
command! -nargs=1 Rg 
    \ call fzf#vim#grep('rg --column --line-number --color=always --smart-case '.<q-args>, 1)

" Term shortcuts
function! Toggle_line_nums()
    let l:isNumOn = trim(execute("set number?"))
    if l:isNumOn == "number"
        execute("set nonumber")
    else
        execute("set number")
    endif
endfunction

nnoremap <leader>v :call term_start("zsh", { "vertical":1 })<CR>
" <leader>b is used by pymode.... 
nnoremap <leader>x :call term_start("zsh")<CR>
nnoremap <leader><leader>v :call Toggle_line_nums()<CR>
" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Tab Bar shortcut
nnoremap <leader>t :TagbarToggle<CR>

" Default browser
let g:open_url_browser_default = "firefox"

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

function! LoadSpecificFunctions()
	:new
	:0r! whoami
	let l:whoAmI = getline(0,1)[0]
	if l:whoAmI == "ezleeda"
		source ~/.vim/ericsson.vim
	endif
	:q!
endfunction

call LoadSpecificFunctions()

command! UnMinify call UnMinify()
function! UnMinify()
	%s/{\ze[^\r\n]/{\r/g
	%s/){/) {/g
	%s/};\?\ze[^\r\n]/\0\r/g
	%s/;\ze[^\r\n]/;\r/g
	%s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
	normal ggVG=
endfunction

" Underscore problem
set linespace=10

" If vim version less than 800, turn off deoplete
if v:version < 800
    call deoplete#disable()
endif

if $USER == "dariuslee"
    let cwdvar = matchstr(getcwd(), "motionlogic")
    if cwdvar != ""
        autocmd BufRead,BufNewFile *.conf set filetype=json
     endif

    " Local vim settings
    call lh#local_vimrc#munge('whitelist', $HOME.'/motionlogic')
endif
