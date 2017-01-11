set nocompatible
filetype off
" will use Vundle instead
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'pearofducks/ansible-vim'
Plugin 'vim-scripts/indentpython.vim'
"Vundle will tell us that the installtion failed
"remember to do a "pip install neovim" before 
"running the installation script for YCM in YCM folder:
"./install.sh --clang-completer --system-libclang --omnisharp-completer
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just:PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

" sensible tab
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab

" security issue in modelines, might be dated
set modelines=0

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

" use "," as leader
let mapleader = ","

" python regex
nnoremap / /\v
vnoremap / /\v

" smart search
set ignorecase
set smartcase

" global substitutions as defaults
set gdefault

" better highlight
set incsearch
set showmatch
set hlsearch
" clean out search
nnoremap <leader><space> :noh<cr>

" use tab instead of % to match brackes
nnoremap <tab> %
vnoremap <tab> %

" wrap lines, not in use, im to sloppy... :s
"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

nnoremap j gj
nnoremap k gk

"replace esc
inoremap jj <ESC>

"Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
