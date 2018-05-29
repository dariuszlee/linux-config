set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Comments/Surround
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
" Status line
Plugin 'itchyny/lightline.vim'
" Color schemes
Plugin 'morhetz/gruvbox'
" Zeal
Plugin 'KabbAmine/zeavim.vim'

call vundle#end()
filetype plugin indent on
