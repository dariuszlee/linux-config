tnoremap <C-n> <C-\><C-n>
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>j <C-\><C-n><C-w>j

set scrollback=100000

nnoremap <leader><leader>r :source ~/.config/nvim/init.vim<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()
call plug#begin('~/.vim/bundle/')

" Async
Plug 'skywind3000/asyncrun.vim'

" Language Specific
"" GO
" Plug 'fatih/vim-go'

" Telescope/Project.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ahmedkhalf/project.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'

" Debug
Plug 'puremourning/vimspector'

" Jupyter Notebook
Plug 'luk400/vim-jukit' 

"
" Latex
Plug 'vim-latex/vim-latex'

" Javascript / Typescript / Jsx / tsx
Plug 'maxmellon/vim-jsx-pretty'
 
"" Python
" Plug 'tmhedberg/SimpylFold'

" Scala
" Plug 'derekwyatt/vim-scala'

" RMarkdown
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-rmarkdown'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'w0rp/ale'

" Window finder
Plug 't9md/vim-choosewin'

" Snippets
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
" Plug 'justinmk/vim-sneak'
" Plug 'jiangmiao/auto-pairs'

" Fuzzy
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

" File formatting
Plug 'maksimr/vim-jsbeautify'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" Lightline
Plug 'itchyny/lightline.vim'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'

" Color schemes
Plug 'morhetz/gruvbox'
" Plug 'w0ng/vim-hybrid'
Plug 'dracula/vim', {'as':'dracula'}

" REPL

" Plug 'sillybun/vim-repl'
" Plug 'HiPhish/repl.nvim'

" Open url
" Plug 'dhruvasagar/vim-open-url'

" Project Vimrc
" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/local_vimrc'

" File system
Plug 'scrooloose/nerdtree'

" Folding
" Plug 'pseewald/vim-anyfold'

" Hex????
Plug 'fidian/hexmode'

" Personal Plugs
" Plug 'dariuszlee/vim-dzl-replace'
Plug 'dariuszlee/vim-dzl-gitdiff'

" Neovim
" Plug 'floobits/floobits-neovim'

call plug#end()
" call vundle#end()            " required
" filetype plugin indent on    " required

" Telescope key binds
set spelllang=en
nnoremap <leader>u <cmd>Telescope<cr>
" nnoremap <leader>a <cmd>Telescope grep_string<cr>
nnoremap <leader>p <cmd>Telescope projects<cr>
" nnoremap ; <cmd>Telescope git_files<cr>
" nnoremap <leader>; <cmd>Telescope git_files<cr>
nnoremap <leader>f <cmd>Telescope git_status<cr>
nnoremap <leader>b <cmd>Telescope git_branches<cr>
nnoremap <leader>c <cmd>Telescope git_commits<cr>
nnoremap <leader>i <cmd>Telescope treesitter<cr>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<cr>
" nnoremap <leader>; <cmd>Telescope buffers<cr>
nnoremap <leader>o <cmd>Telescope registers<cr>
nnoremap <leader>m <cmd>Telescope marks<cr>
nnoremap <leader>k <cmd>Telescope tags<cr>
nnoremap <Leader><leader>k <cmd>Telescope tags <c-r>=expand("<cword>")<CR><CR>

lua << EOF
  require('telescope').setup{
    defaults = {
       vimgrep_arguments = {
        'rg',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      color_devicons = true,
      disable_devicons = false
    }
  }
  require("project_nvim").setup {
      manual_mode = false,

      -- Methods of detecting the root directory. **"lsp"** uses the native neovim
      -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
      -- order matters: if one is not detected, the other is used as fallback. You
      -- can also delete or rearangne the detection methods.
      detection_methods = { "lsp", "pattern" },

      -- All the patterns used to detect root dir, when **"pattern"** is in
      -- detection_methods
      patterns = { ".git" },

      -- Table of lsp clients to ignore by name
      -- eg: { "efm", ... }
      ignore_lsp = {},

      -- When set to false, you will get a message when project.nvim changes your
      -- directory.
      silent_chdir = true,
  }
  require('telescope').load_extension('projects')
  -- require'lspconfig'.pyright.setup(
  --   coq.lsp_ensure_capabilities()
  -- )
EOF

set nofixendofline
set noeol

" if has('nvim-0.5')
"   augroup lsp
"     au!
"     autocmd FileType java lua require('jdtls_setup').setup()
"     " au FileType java lua require('jdtls').start_or_attach()
"   augroup end
" endif

let g:coq_settings = {'auto_start': v:true }

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
  nnoremap <leader><leader>f :call ClearFirstLineJava()<cr>
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
" set wildmenu        " Show auto complete suggestions  
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
noremap <leader><leader>s :CocCommand<cr>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <Tab>
"  		 \ pumvisible() ? "\<C-n>" :
"  		 \ <SID>check_back_space() ? "\<Tab>" :
"  		 \ coc#refresh()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
" autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
" autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
" autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

" Jupyter
let g:jukit_output_bg_color = get(g:, 'jukit_output_bg_color', '')
"    - Optional custom background color of output split window (i.e. target window of sent code)
let g:jukit_output_fg_color = get(g:, 'jukit_output_fg_color', '')
"    - Optional custom foreground color of output split window (i.e. target window of sent code)
let g:jukit_outhist_bg_color = get(g:, 'jukit_outhist_bg_color', '#090b1a')
"    - Optional custom background color of output-history window
let g:jukit_outhist_fg_color = get(g:, 'jukit_outhist_fg_color', 'gray')
"    - Optional custom foreground color of output-history window
let g:jukit_output_new_os_window = 0
"    - If set to 1, opens output split in new os-window. Can be used to e.g. write code in one kitty-os-window on your primary monitor while sending code to the shell which is in a seperate kitty-os-window on another monitor.
let g:jukit_outhist_new_os_window = 0
"    - Same as `g:jukit_output_new_os_window`, only for output-history-split

let g:jukit_shell_cmd = 'ipython3'
"    - Specifies the command used to start a shell in the output split. Can also be an absolute path. Can also be any other shell command, e.g. `R`, `julia`, etc. (note that output saving is only possible for ipython)
let g:jukit_terminal = ''
"   - Terminal to use. Can be one of '', 'kitty', 'vimterm', or 'nvimterm'. If '' is given then will try to detect terminal
let g:jukit_auto_output_hist = 0
"   - If set to 1, will create an autocmd with event `CursorHold` to show saved ipython output of current cell in output-history split. Might slow down (n)vim significantly, you can use `set updatetime=<number of milliseconds>` to control the time to wait until CursorHold events are triggered, which might improve performance if set to a higher number (e.g. `set updatetime=1000`).
let g:jukit_use_tcomment = 0
"   - Whether to use tcomment plugin (https://github.com/tomtom/tcomment_vim) to comment out cell markers. If not, then cell markers will simply be prepended with `g:jukit_comment_mark`
let g:jukit_comment_mark = '#'
"   - See description of `g:jukit_use_tcomment` above
let g:jukit_mappings = 1
"   - If set to 0, none of the default function mappings (as specified further down) will be applied
let g:jukit_output_bg_color = get(g:, 'jukit_output_bg_color', '')
"    - Optional custom background color of output split window (i.e. target window of sent code)
let g:jukit_output_fg_color = get(g:, 'jukit_output_fg_color', '')
"    - Optional custom foreground color of output split window (i.e. target window of sent code)
let g:jukit_outhist_bg_color = get(g:, 'jukit_outhist_bg_color', '#090b1a')
"    - Optional custom background color of output-history window
let g:jukit_outhist_fg_color = get(g:, 'jukit_outhist_fg_color', 'gray')
"    - Optional custom foreground color of output-history window
let g:jukit_output_new_os_window = 0
"    - If set to 1, opens output split in new os-window. Can be used to e.g. write code in one kitty-os-window on your primary monitor while sending code to the shell which is in a seperate kitty-os-window on another monitor.
let g:jukit_outhist_new_os_window = 0
"    - Same as `g:jukit_output_new_os_window`, only for output-history-split
let g:jukit_savefig_dpi = 150
"    - Value for `dpi` argument for matplotlibs `savefig` function
let g:jukit_inline_plotting = 1
"    - Whether to enable inside-terminal-plotting or not. Only supported for kitty terminal
let g:jukit_mpl_block = 1
"    - If set to 0, then `plt.show()` will by default be executed as if `plt.show(block=False)` was specified.

" IF KITTY IS USED:
let g:jukit_mpl_style = jukit#util#plugin_path() . '/helpers/matplotlib-backend-kitty/backend.mplstyle'
"    - File specifying matplotlib plot options. This is the default value if kitty terminal is used
" ELSE:
" let g:jukit_mpl_style = ''
"    - 
" You can define a custom split layout as a dictionary, the default is:
let g:jukit_layout = {
    \'split': 'horizontal',
    \'p1': 0.6, 
    \'val': [
        \'file_content',
        \{
            \'split': 'vertical',
            \'p1': 0.6,
            \'val': ['output', 'output_history']
        \}
    \]
\}

""""""""""""""""""""""

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
nnoremap <leader>gb :Git blame<CR>

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
" let $FZF_DEFAULT_COMMAND='git ls-tree -r --name-only HEAD'
nnoremap ;; :Files<CR>
nnoremap ;g :GFiles<CR>
nnoremap ;s :GFiles -- . ':!:*test*'<CR>
nnoremap ;t :GFiles '*test*'<CR>
nnoremap ;c :GFiles -- '*.cpp' '*.h' '*.c' <CR>
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>l :Tags<CR>
nnoremap <Leader><leader>l :Tags <c-r>=expand("<cword>")<CR><CR>
" nnoremap <leader>bl :BTags<CR>
" nnoremap <leader>/ :BLines<CR>
" nnoremap <leader>c :Commit<CR>
" nnoremap <leader>bc :BCommit<CR>
" nnoremap <leader>w :Windows<CR>

" Coc -> lightline
set statusline^=%{coc#status()}
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status'
\ },
\ }
" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
call lightline#enable()

nnoremap <leader>aa :Rg <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>as :Rgsource <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>at :Rgtest <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>ac :Rgc <c-r>=expand("<cword>")<CR><CR>
nnoremap <leader>ap :Rgpy <c-r>=expand("<cword>")<CR><CR>
" set rtp+=~/.fzf
" set rtp+=/usr/local/opt/fzf
" let g:rg_derive_root='true'
" set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
command! -nargs=1 Rg 
 		 \ call fzf#vim#grep('rg --vimgrep --column --line-number --color=always --smart-case --follow '. string(<q-args>), 1)

command! -nargs=1 Rgc
 		 \ call fzf#vim#grep('rg --vimgrep --column --line-number --color=always --smart-case --follow -th -tcpp '. string(<q-args>), 1)
command! -nargs=1 Rgpy
 		 \ call fzf#vim#grep('rg --vimgrep --column --line-number --color=always --smart-case --follow -tpy '. string(<q-args>), 1)
command! -nargs=1 Rgsource
 		 \ call fzf#vim#grep('rg --vimgrep --column --line-number --color=always --smart-case --follow -g "!*test*" '. string(<q-args>), 1)
command! -nargs=1 Rgtest
 		 \ call fzf#vim#grep('rg --vimgrep --column --line-number --color=always --smart-case --follow -g "*test*" '. string(<q-args>), 1)
" command! -nargs=1 Rg 
"     \ call fzf#vim#grep('rg --column --line-number '. string(<q-args>), 1)

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

" function! SetFzfDefault()
"   :new
"   let l:isGit = CheckIfGit()
"   :q!
"   if l:isGit == 0 || l:isGit == 1
"     if has('win32')
"       let $FZF_DEFAULT_COMMAND = 'wsl find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
"     else
"       let $FZF_DEFAULT_COMMAND = 'find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//'
"     endif
"   elseif l:isGit == 2
"  	 let $FZF_DEFAULT_COMMAND = 'git ls-tree -r --name-only HEAD'
"   else
"  	 echom "Case not handled at the moment. Read CheckIfGit()"
"   endif
" endfunction

" SET FZF 
" silent call SetFzfDefault()

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

if $USER == "dariuslee"
  let cwdvar = matchstr(getcwd(), "motionlogic")
  if cwdvar != ""
 	 autocmd BufRead,BufNewFile *.conf set filetype=json
  endif

  " Local vim settings
  call lh#local_vimrc#munge('whitelist', $HOME.'/motionlogic')
endif

" Color scheme config
" colorscheme gruvbox 
colorscheme dracula
" let g:gruvbox_termcolors = '256'
" let g:gruvbox_contrast_dark = 'hard'
set background=dark " Dark Mode
highlight Normal ctermbg=0

function! ProcessFirstLineJava()
  let @b = 'stop at ' . split(split(getline(1), ' ')[1], ';')[0] . '.' . expand('%:t:r') . ':' . line(".")
endfunction

function! ClearFirstLineJava()
  let @b = 'clear ' . split(split(getline(1), ' ')[1], ';')[0] . '.' . expand('%:t:r') . ':' . line(".")
endfunction

" Vimspector
nmap <Leader><Leader>9 <Plug>VimspectorPause
nmap <Leader><Leader>8 :VimspectorReset<CR>
nmap <Leader><Leader>7 :call vimspector#ClearBreakpoints()<CR>
nmap <Leader><Leader>6 :call vimspector#Launch()<CR>
nmap <Leader><Leader>5 :call vimspector#Continue()<CR>
nmap <Leader><Leader>4 :call vimspector#ToggleBreakpoint()<CR>
nmap <Leader><Leader>3 <Plug>VimspectorStepOut
nmap <Leader><Leader>2 <Plug>VimspectorStepInto
nmap <Leader><Leader>1 <Plug>VimspectorStepOver 

" Easy Motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


"" Coc stuff
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> gn <Plug>(coc-diagnostic-prev)
nnoremap <silent> gp <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>ge <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> gp <Plug>(coc-diagnostic-next-error)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader><leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader><leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader><leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader><leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>