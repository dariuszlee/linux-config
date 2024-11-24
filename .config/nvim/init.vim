"""""" Finally load the lua config
let g:_jukit_is_windows = 0
lua require('plugins')

tnoremap <C-n> <C-\><C-n>
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>j <C-\><C-n><C-w>j

set scrollback=100000

" Silence error messages

set nocompatible              " be iMproved, required
filetype off                  " required

" set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/bundle/')

Plug 'luk400/vim-jukit' ,
call plug#end()

autocmd BufWritePost *.py !black % 
autocmd BufWritePost *.py !isort % 
autocmd BufWritePost *.py !autoflake -i --remove-all-unused-imports % 

" Config MUST BE FIRST
let mapleader = ","
nnoremap <leader><leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><leader>t :e ~/.config/nvim/init.vim<CR>

" Telescope key binds
set spelllang=en
nnoremap <leader>u :Telescope<cr>
" nnoremap <leader>a :Telescope grep_string<cr>
nnoremap <leader>p :Telescope projects<cr>
" nnoremap ; :Telescope git_files<cr>
" nnoremap <leader>; :Telescope git_files<cr>
nnoremap <leader>f :Telescope git_status<cr>
nnoremap <leader>b :Telescope git_branches<cr>
nnoremap <leader>c :Telescope git_commits<cr>
nnoremap <leader>i :Telescope treesitter<cr>
nnoremap <leader>/ :Telescope current_buffer_fuzzy_find<cr>
" nnoremap <leader>; :Telescope buffers<cr>
nnoremap <leader>o :Telescope registers<cr>
nnoremap <leader>m :Telescope marks<cr>
nnoremap <leader>k :Telescope tags<cr>
nnoremap <Leader><leader>k :Telescope tags <c-r>=expand("<cword>")<CR><CR>

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

imap jj <Esc>

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
  " echom "X11 Sesssion"
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

let g:_jukit_ps = '/'
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

nnoremap <leader><cr> <CMD>call jukit#send#line()<cr>
nnoremap <leader>jt :let g:jukit_ipython=1<cr>
nnoremap <leader>jT :let g:jukit_ipython=0<cr>

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


" Snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<C-d>"

" Handling swap files
augroup SwapFileGroup
  autocmd!
  autocmd  SwapExists  *  :let v:swapchoice = 'e'
augroup END

" lazy git hotkeys
nnoremap <leader><leader>lg :LazyGit<CR>


" Syntax
syntax on

" Tab Movement helpers
nnoremap <leader><leader>c :q!<CR>
nnoremap <leader>n :tabn 
nnoremap <leader>tc :tabc<CR>

" lightline
set laststatus=2

" Fugitive
nnoremap <leader><leader>gdha :DiffviewFileHistory<CR>
nnoremap <leader><leader>gdhf :DiffviewFileHistory %<CR>
nnoremap <leader><leader>gdd :DiffviewOpen<CR>
nnoremap <leader><leader>gda :DiffviewOpen
nnoremap <leader><leader>gdc :DiffviewClose<CR>

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
nnoremap <leader>/ :BLines<CR>
" nnoremap <leader>c :Commit<CR>
" nnoremap <leader>bc :BCommit<CR>
" nnoremap <leader>w :Windows<CR>

" Rg
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


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


""""""""""""""" Codeium Stuff
inoremap <script><silent><nowait><expr> <c-space> codeium#Accept()