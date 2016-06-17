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
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
" End of personal plugins

call vundle#end()     " required
filetype plugin indent on " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
"                       :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                       auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Set colors for linux terminal
set t_Co=256

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

" Theme
set background=dark
colorscheme hybrid_material

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" vim-gitgutter by default
let g:gitgutter_enabled = 1

"""""""""""""""""""""""""""""""""""""""
""""""""""" Custom stuff """"""""""""""
"""""""""""""""""""""""""""""""""""""""

" Remove -- INSERT -- from below airline
set noshowmode

" Highlight lines over 80 chars
highlight OverLength ctermbg=blue ctermfg=black guibg=#592929
match OverLength /\%81v.\+/

" Ctrl-D: Move to now line
map <C-D> i<BS><CR><ESC>
nnoremap <C-X> :w<CR>
inoremap <C-X> <C-O>:w<CR>

