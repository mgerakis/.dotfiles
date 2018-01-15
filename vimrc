set nocompatible    " be iMproved, Vundle required
filetype off        " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


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
Plugin 'VundleVim/Vundle.vim'

" Personal plugins
" File tree
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
" Bottom bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git change notificiations in gutter
Plugin 'airblade/vim-gitgutter'
" Close (, {, etc
Plugin 'Townk/vim-autoclose'
" Close html tags
Plugin 'alvan/vim-closetag'
" For vim / tmux pane movement integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
" Typescript tings
Plugin 'shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
" File fuzzy finding
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'rhysd/vim-clang-format'
" Surround words with stuff
Plugin 'tpope/vim-surround'
" Viewing image previews in vim
Plugin 'ashisha/image.vim'
" Syntax highlighting for scss
Plugin 'cakebaker/scss-syntax.vim'
" End of personal plugins

call vundle#end()     " required

filetype plugin indent on " required

" Swap file stuff
set nobackup
set nowb
set noswapfile

" Backspace works normally
set backspace=indent,eol,start

set eol
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
colorscheme Tomorrow-Night-Eighties
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

" Saving requires NERDTree to be closed due to bug with nerdtree-git-plugin and
" syntastic
inoremap jk <C-c>:NERDTreeClose<CR><bar>:w<CR>

nnoremap <leader>w :NERDTreeClose<CR><bar>:w<CR>

nnoremap <leader>f :CtrlP ./<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

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

nnoremap <leader>f :ClangFormat<CR>
autocmd FileType typescript ClangFormatAutoEnable

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

" Copy to system clipboard
nnoremap <leader>y "+y
" Paste from system clipboard
nnoremap <leader>p "+p

let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

let g:tsuquyomi_use_dev_node_module = 2

nnoremap <silent> <leader>h :echo tsuquyomi#hint()<CR>

let g:closetag_filenames = "*.html"

set foldmethod=syntax

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_html_checkers = ['']

set autoread

if !empty(glob("~/.vim_extras"))
  source ~/.vim_extras
endif
