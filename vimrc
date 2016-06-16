set nocompatible    " be iMproved, Vundle required
filetype off        " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Personal plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'kristijanhusak/vim-hybrid-material'
" End of personal plugins

call vundle#end()     " required
filetype plugin indent on " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Keep syntax on
syntax on

" Wrap lines
set wrap

" Set cursor line highlight
set cursorline

" Line and column numbers
set ruler
set nu

" Status line
set laststatus=2
set statusline=%f

" Theme
set background=dark
colorscheme hybrid_material

