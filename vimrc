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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Townk/vim-autoclose'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'shougo/vimproc.vim'
Plugin 'quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
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

" Swap file stuff
set nobackup
set nowb
set noswapfile

" Backspace works normally
set backspace=indent,eol,start

" Set colors for linux terminal
set t_Co=256

" Keep syntax on
syntax on

" Opening file hides current file rather than closes
set hidden

" Wrap lines
set wrap

" Set cursor line highlight
set cursorline

" Line and column numbers
set ruler
set relativenumber

" Status line
set laststatus=2

" Theme
colorscheme flatui
set background=dark

" Better Highlighting for Search
hi Search cterm=NONE ctermbg=white ctermfg=black

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" vim-gitgutter by default
let g:gitgutter_enabled = 1

" close vim if only tab up is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
	\ b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden = 1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sass', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"""""""""""""""""""""""""""""""""""""""
""""""""""" Custom stuff """"""""""""""
"""""""""""""""""""""""""""""""""""""""
" leader key to ,
let mapleader = ","

" Remove -- INSERT -- from below airline
set noshowmode

" Highlight 81 first line
set cc=81

" Ctrl-D: Move to new line
map <C-D> i<BS><CR><ESC>

inoremap jk <C-c>:w<CR>

nnoremap <leader>w :w<CR>

" <leader>p: CtrlP
nnoremap <leader>p :CtrlP<CR>
" <leader>n: Toggle NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>

" <leader>r: source vimrc
nnoremap <leader>r :source $MYVIMRC<CR>

" Remove hilight
map <silent> <leader><cr> :noh<cr>

" Make switching between panes interfere with tmux less
if !exists("g:loaded_tmux_navigator")
  nnoremap <C-h> <C-W><Left>
  nnoremap <C-j> <C-W><Down>
  nnoremap <C-k> <C-W><Up>
  nnoremap <C-l> <C-W><Right>
endif

" Tabs are 2, no spaces. Makefile tabs automatically do 8
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Fix tabs to do 2 spaces
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set showmatch
set so=7
set hlsearch
set incsearch

" For zooming into window
let g:zoomed=0
function! Zoom()
  if g:zoomed == 0
    exe "normal \<C-w>\|"
    exe "normal \<C-w>\_"
    let g:zoomed=1
  else
    let g:zoomed=0
    if g:NERDTree.IsOpen()
      :NERDTreeFocus
      exe "vertical resize 32"
      exe "normal \<C-w>\p"
    endif
    exe "normal \<C-w>\="
  endif
endfunction

nnoremap <C-z> :call Zoom()<cr>

" stop new-line comment crap
set formatoptions-=r


" Spell checking
" autocmd FileType markdown setlocal spell spelllang=en_us
" set spell spelllang=en_us
" use [s and ]s to jump to misspelled words
" use z= to have vim suggest alternatives
"

let g:tsuquyomi_use_dev_node_module = 2
nnoremap <silent> <leader>h :echo tsuquyomi#hint()<CR>
