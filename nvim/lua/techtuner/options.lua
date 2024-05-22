local set = vim.opt

set.number = true
set.relativenumber = true

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.softtabstop = 2

set.autoindent = true
set.smartindent = true

set.conceallevel = 2 

set.wrap = true

set.backup = false
set.swapfile = false
set.undofile = true

set.incsearch = true
set.hlsearch = true


set.termguicolors = true
set.background = "dark"
set.updatetime = 50

set.scrolloff = 10
set.sidescrolloff = 10

-- set.clipboard:append("unnamed,unnamedplus")
set.showmode = false

set.laststatus = 0

set.splitbelow = true
set.splitright = true

set.pumheight = 10

set.iskeyword:append("-")
set.isfname:append("@-@")
set.completeopt = "menu,menuone,noselect"

set.wildignore:append({"/node_modules/*"})
