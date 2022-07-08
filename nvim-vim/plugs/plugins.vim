call plug#begin()

" Required for other plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Colorscheme and Statusline
Plug 'luisiacc/gruvbox-baby'
Plug 'mkitt/tabline.vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'

"Startup
Plug 'mhinz/vim-startify'
Plug 'tweekmonster/startuptime.vim'

" Git Signs
Plug 'lewis6991/gitsigns.nvim'

"Telescope File Finders
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim' " Image Support for Telescope

" Commenting
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-commentary'
" File Icons
Plug 'kyazdani42/nvim-web-devicons'

" File Explorer
Plug 'kyazdani42/nvim-tree.lua'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Programming Language
Plug 'pangloss/vim-javascript', {'for' : ['javascript','html']} " JavaScript Support
Plug 'mxw/vim-jsx' " JSX Support
Plug 'rust-lang/rust.vim' " Rust Language
Plug 'ray-x/go.nvim' " Go Language
Plug 'vim-scripts/JavaScript-Indent',  { 'for': 'javascript' }

" Syntax Highlighter
Plug 'pearofducks/ansible-vim', { 'for': 'yaml' } " Yaml Files 
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tweekmonster/impsort.vim', {'for': 'python'}

call plug#end()
