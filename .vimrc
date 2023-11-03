" Turn syntax highlighting on
syntax on

" Set the numbers and relative number to the file
set number
set relativenumber

" Enables the use of mouse in vim
set mouse="a"

" Disable compatibility with vi which can cause some issues
set nocompatible

" Detect file type detection and path
filetype on
filetype plugin on
filetype indent on

" Setting shift and tab width
set shiftwidth=2
set tabstop=2
set expandtab

" Do not backup any files
set nobackup

" DO not wrap the lines
set nowrap

" Incrementing while searching a word or sentence
set incsearch
set hlsearch

set smartcase

" Enable auto completion menu after pressing TAB
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Plugin Manager - Vim Plus
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'

call plug#end()

" Keyboard mapping
let mapleader=" "