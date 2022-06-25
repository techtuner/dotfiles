" -----------------------------------------------
" General Settings
" -----------------------------------------------

syntax on
set autoindent
set number
set relativenumber
set scrolloff=10
set smartindent
set showmatch
set ignorecase
set tabstop=4
set hlsearch
set mouse=a
set incsearch
set softtabstop=4
set expandtab
set cursorline
set ttyfast
set wildmode=longest,list
set termguicolors
set splitright
set splitbelow
set shiftwidth=4

" -----------------------------------------------
" Plugins
" -----------------------------------------------

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'ray-x/go.nvim'
Plug 'tribela/vim-transparent'
Plug 'junegunn/fzf'
Plug 'tpope/vim-pathogen'
Plug 'pangloss/vim-javascript' 
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'catppuccin/nvim', {'as':'catppuccin'}
Plug 'itchyny/lightline.vim'
Plug 'techtuner/wryan-neovim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
Plug 'preservim/nerdcommenter'
call plug#end()

" -----------------------------------------------
" Color scheme
" -----------------------------------------------

colorscheme catppuccin
let g:airline_theme='wryan'


" -----------------------------------------------
" Remapping
" -----------------------------------------------
let mapleader = " "
nnoremap <leader>t :NERDTree<CR>
nnoremap <leader><CR> :so%<CR>
vnoremap <leader><CR> :so%<CR>
noremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
nnoremap <silent> <C-n> :tabnew<CR> " Create a New tab
nnoremap <silent> <C-w> :tabclose<CR> " Close the current tab
nnoremap <silent> <S-Left> :tabnext -<CR> " Switch to previous tab
nnoremap <silent> <S-Right> :tabnext +<CR> " Switch to next tab
nnoremap <silent> <C-Left> :-tabmove -<CR> " Move the tab back
nnoremap <silent> <C-Right> :-tabmove +<CR> " Move tab next
