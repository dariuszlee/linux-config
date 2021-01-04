set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Async
Plugin 'skywind3000/asyncrun.vim'

" Language Specific
"" GO
Plugin 'fatih/vim-go'

"
" Latex
Plugin 'vim-latex/vim-latex'

" Javascript / Typescript / Jsx / tsx
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'maxmellon/vim-jsx-pretty'
 
"" Python
Plugin 'tmhedberg/SimpylFold'

" Scala
Plugin 'derekwyatt/vim-scala'

" RMarkdown
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-rmarkdown'

" Code Completion
" Plugin 'neoclide/coc.nvim'
Plugin 'neoclide/coc.nvim', {'pinned':1}
" Plugin 'w0rp/ale'

" Window finder
Plugin 't9md/vim-choosewin'

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
Plugin 'justinmk/vim-sneak'
Plugin 'jiangmiao/auto-pairs'

" Fuzzy
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" File formatting
Plugin 'maksimr/vim-jsbeautify'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" Lightline
Plugin 'itchyny/lightline.vim'
" Syntax
" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'

" REPL
" Plugin 'sillybun/vim-repl'
Plugin 'HiPhish/repl.nvim'

" Open url
Plugin 'dhruvasagar/vim-open-url'

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

" Neovim
Plugin 'floobits/floobits-neovim'

call vundle#end()            " required
filetype plugin indent on    " required

let g:deoplete#enable_at_startup = 1
set nofixendofline
set noeol
"source ~/.vim/plugins.vim

" Formatting settings
" Glaive codefmt google_java_executable=
" Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

call glaive#Install()
" let g:java_format_exe = "Glaive codefmt google_java_executable=\"java -jar ".$HOME."/.vim/google-java-format-1.8-all-deps.jar\""
let g:java_format_exe = "Glaive codefmt google_java_executable=\"java -jar ".$HOME."/.vim/google-java-format-1.3-all-deps.jar\""
execute g:java_format_exe

imap jj <Esc>

set encoding=utf-8

noremap <C-w>h <C-\><C-N><C-w>h
noremap <C-w>j <C-\><C-N><C-w>j
noremap <C-w>k <C-\><C-N><C-w>k
noremap <C-w>l <C-\><C-N><C-w>l
noremap <C-w>h <C-\><C-N><C-w>h
noremap <C-w>j <C-\><C-N><C-w>j
noremap <C-w>k <C-\><C-N><C-w>k
noremap <C-w>l <C-\><C-N><C-w>l
noremap <C-w>h <C-w>h
noremap <C-w>j <C-w>j
noremap <C-w>k <C-w>k
noremap <C-w>l <C-w>l


" F2, F4, 
imap <F2> <Esc>
imap <F3> <Esc>
imap <F4> <Esc>
imap <F5> <Esc>
imap <F6> <Esc>
imap <F7> <Esc>
imap <F8> <Esc>
imap <F9> <Esc>
imap <F10> <Esc>
imap <F11> <Esc>
imap <F12> <Esc>

" Parcel parcel configs
augroup filetype jss_css_html
  nnoremap <c-i><c-i> :AsyncRun NODE_ENV=development parcel build src/*.html --no-minify --public-url '.'<CR>
augroup END

set tabstop=4
set shiftwidth=4
set expandtab
augroup filetype java 
  highlight link javaScopeDecl Statement
  highlight link javaType Type
  highlight link javaDocTags PreProc
  let g:java_highlight_functions = 1
  let g:java_highlight_all = 1
  " Spacing
  set tabstop=2
  set shiftwidth=2
  set expandtab
  nnoremap <leader><leader>d :call ProcessFirstLineJava()<cr>
augroup END

" Line numbering
set number
set numberwidth=1

" Window Chooser
nmap <c-y> <Plug>(choosewin)
tmap <c-y> <C-n><Plug>(choosewin)

" Terminal mode easy paste
tmap <c-b> <c-w>""

" Etc configs
set number          " Show line numbers                   
set wildmenu        " Show auto complete suggestions  
set showmatch       " Show surrounding match          

set incsearch       " search as characters entered    
set hlsearch        " Highligh search matches         

" Terminal scroll back size
tnoremap <C-n> <C-\><C-N>

augroup filetype typescript 
  autocmd!
  autocmd Filetype typescript UltiSnipsAddFiletypes typescript.javascript
augroup END

augroup filetype html
  autocmd!
  autocmd FileType html setlocal foldmethod=indent
augroup END

" Coc.nvim style plugins
autocmd FileType python let b:coc_root_patterns = ['.vim', '.env']
noremap <leader><leader>a :CocAction<cr>
set statusline^=%{coc#status()}

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
 		 \ pumvisible() ? "\<C-n>" :
 		 \ <SID>check_back_space() ? "\<Tab>" :
 		 \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ALE Fixers
nmap <F8> <Plug>(ale_fix)
let g:ale_fixers = {
 		 \ 'javascript': [
 		 \   'prettier'
 		 \ ],
 		 \ 'typescript': [
 		 \   'prettier'
 		 \ ],
 		 \ }


" Copy copy utils
if $XDG_SESSION_TYPE != 'x11' && executable('wl-copy')
  echom "Wayland Sesssion"
  xnoremap "+y y:call system("wl-copy", @")<cr>
  nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

  " Copy file path
  nnoremap fyy y:call system("wl-copy", expand("%:p"))<CR>
elseif executable('clip.exe')
  xnoremap "+y y:call system("clip.exe", @")<cr>
  nnoremap "+p :let @"=substitute(system("clip.exe"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap "*p :let @"=substitute(system("clip.exe"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap fyy y:call system("clip.exe", expand("%:p"))<CR>
else 
  echom "X11 Sesssion"
  xnoremap "+y y:call system("xclip -sel clip", @")<cr>
  nnoremap "+p :let @"=substitute(system("xclip -o -sel clip"), '<C-v><C-m>', '', 'g')<cr>p
  nnoremap "*p :let @"=substitute(system("xclip -o -sel clip"), '<C-v><C-m>', '', 'g')<cr>p

  " Copy file path
  nnoremap fyy y:call system("xclip -sel clip", expand("%:p"))<CR>
endif


" Vnews
let g:Vnews#browser_command = "qutebrowser"


" Replace word under cursor
nnoremap <C-a> :%s/<c-r>=expand("<cword>")<cr>/

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
nnoremap <leader><leader>y :e ~/.config/nvim/init.vim<CR>

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

" lightline
set laststatus=2

" Fugitive
nnoremap <leader><leader>g :Gstatus<CR>

" Turn on diff
nnoremap <leader>d :windo diffthis<CR>
nnoremap <leader>e :windo diffoff<CR>

" fzf
let $FZF_DEFAULT_COMMAND='git ls-tree -r --name-only HEAD'
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
" set rtp+=~/.fzf
" set rtp+=/usr/local/opt/fzf
" let g:rg_derive_root='true'
" set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
command! -nargs=1 Rg 
 		 \ call fzf#vim#grep('rg --vimgrep --column --line-number --color=always --smart-case --follow '. string(<q-args>), 1)
" command! -nargs=1 Rg 
"     \ call fzf#vim#grep('rg --column --line-number '. string(<q-args>), 1)

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Term shortcuts
function! Toggle_line_nums()
  let l:isNumOn = trim(execute("set number?"))
  if l:isNumOn == "number"
 	 execute("set nonumber")
  else
 	 execute("set number")
  endif
endfunction


" nnoremap <leader>v :call term_start("zsh", { "vertical":1 })<CR>
if has('win32')
  nnoremap <leader>v :vnew term://wsl<CR>
  nnoremap <leader>x :new term://wsl<CR>
else
  nnoremap <leader>v :vnew term://zsh<CR>
  nnoremap <leader>x :new term://zsh<CR>
 endif

" <leader>b is used by pymode.... 
" nnoremap <leader>x :call term_start("zsh")<CR>
nnoremap <leader><leader>v :call Toggle_line_nums()<CR>
" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Tab Bar shortcut
nnoremap <leader>t :TagbarToggle<CR>

" Default browser
let g:open_url_browser_default = "qutebrowser"

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
    if has('win32')
      let $FZF_DEFAULT_COMMAND = 'wsl find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
    else
      let $FZF_DEFAULT_COMMAND = 'find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
    endif
  elseif l:isGit == 2
 	 let $FZF_DEFAULT_COMMAND = 'git ls-tree -r --name-only HEAD'
  else
 	 echom "Case not handled at the moment. Read CheckIfGit()"
  endif
endfunction

" SET FZF 
silent call SetFzfDefault()

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

" Color scheme config
colorscheme gruvbox 
let g:gruvbox_termcolors = '256'
let g:gruvbox_contrast_dark = 'hard'
set background=dark " Dark Mode
highlight Normal ctermbg=0

function! ProcessFirstLineJava()
  let @b = 'b ' . split(split(getline(1), ' ')[1], ';')[0] . '.' . expand('%:t:r') . ':' . line(".")
endfunction