set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Language Specific
"" GO
Plugin 'fatih/vim-go'
"" Python
Plugin 'python-mode/python-mode'
Plugin 'tmhedberg/SimpylFold'
" Plugin 'davidhalter/jedi-vim'

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

" Personal Plugins
Plugin 'dariuszlee/vim-dzl-replace'
Plugin 'dariuszlee/vim-dzl-gitdiff'

call vundle#end()            " required
filetype plugin indent on    " required
let g:deoplete#enable_at_startup = 1
