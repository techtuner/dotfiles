set number
set relativenumber
set nohlsearch
set hidden
set wrap
set incsearch
set splitbelow
set splitright
set tabstop=4
set clipboard=unnamed
set signcolumn=no
set cmdheight=2
set mouse=a
set shiftwidth=4
set pumheight=10
set termguicolors
set smartindent
set autoindent
set smartcase
set scrolloff=10
set fileencoding = "utf-8"
set conceallevel=0
set background=dark
set nocursorline
set noruler
set winbl=10

" Allow Italics font
set t_ZH=^[[3m
set t_ZR=^[[23m
" colorscheme gruvbuddy
" Autocommands
	colorscheme gruvbox-baby

autocmd BufWritePre *.py ImpSort!
