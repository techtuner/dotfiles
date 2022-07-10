set number
set relativenumber
set hlsearch
set incsearch
set splitbelow
set splitright
set tabstop=4
set cmdheight=2
set mouse=a
set shiftwidth=4
set pumheight=10
set termguicolors
set smartindent
set autoindent
set smartcase
set numberwidth=4
set scrolloff=100
set sidescrolloff=10
set fileencoding = "utf-8"
set conceallevel=0
set background = "dark"


" Allow Italics font
set t_ZH=^[[3m
set t_ZR=^[[23m
" colorscheme gruvbuddy
" Autocommands
colorscheme horizon

autocmd BufWritePre *.py ImpSort!
