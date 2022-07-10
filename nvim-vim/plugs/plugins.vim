" Plugins

call plug#begin()

" Required Plugins

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Colorscheme

Plug 'tjdevries/colorbuddy.nvim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'ntk148v/vim-horizon'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'


" Snippets

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Comments
Plug 'numToStr/Comment.nvim'

" Startup

Plug 'mhinz/vim-startify'
Plug 'tweekmonster/startuptime.vim'

" Git Signs

Plug 'lewis6991/gitsigns.nvim'

" Telescope File Finders

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim' 

" Programming Language

Plug 'pangloss/vim-javascript', {'for' : ['javascript','html']} " JavaScript Support
Plug 'mxw/vim-jsx' " JSX Support
Plug 'rust-lang/rust.vim' " Rust Language
Plug 'ray-x/go.nvim' " Go Language
Plug 'vim-scripts/JavaScript-Indent',  { 'for': 'javascript' }
Plug 'pearofducks/ansible-vim', { 'for': 'yaml' } " Yaml Files 
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tweekmonster/impsort.vim', {'for': 'python'}
Plug 'nvim-treesitter/nvim-treesitter'
" File Explorer and File Icons

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Completion

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/nvim-lsp-installer'
call plug#end()
