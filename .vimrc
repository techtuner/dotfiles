" Turn syntax highlighting on
syntax on

" Set the numbers and relative number to the file
set number
set relativenumber

" Enables the use of mouse in vim
set mouse=a

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
set list


" Plugin Manager - Vim Plus
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }

call plug#end()


" Keyboard mapping
let mapleader=" "

" <Ctrl+S> to save the file in three mode
nnoremap <C-s> <cmd>update<cr>
inoremap <C-s> <cmd><C-O>update<cr>
vnoremap <C-s> <cmd><C-C>update<cr>

" split the windows
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <leader>sx <cmd>close<cr>

" windows Navigation
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Right> <C-w>l

" Quit vim
nnoremap <leader>q <cmd>q!<cr>
nnoremap <leader>w <cmd>wq!<cr>
