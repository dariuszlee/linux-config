set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Language Specific
"" GO
Plugin 'fatih/vim-go'
"" Python
Plugin 'davidhalter/jedi-vim'

" Complete Engine
Plugin 'ajh17/VimCompletesMe'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Editing
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'

" html/css
Plugin 'mattn/emmet-vim'

" Fuzzy
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" Lightline
Plugin 'itchyny/lightline.vim'
" Syntax
Plugin 'w0rp/ale'
" Color schemes
Plugin 'morhetz/gruvbox'

call vundle#end()            " required
filetype plugin indent on    " required
