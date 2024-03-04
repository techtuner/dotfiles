local set = vim.opt

set.number = true
set.relativenumber = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.smartindent = true
set.autoindent = true

set.wrap = true

set.backup = false
set.swapfile = false
set.undofile = true

set.hlsearch = true
set.incsearch = true

set.termguicolors = true

set.background = "dark"
set.updatetime = 50

set.scrolloff = 8
set.sidescrolloff = 8

set.clipboard:append("unnamed,unnamedplus")
set.showmode = false

set.completeopt = "menu,menuone,noselect"

set.splitbelow = true
set.splitright = true

set.pumheight = 10

set.laststatus = 0

set.iskeyword:append("-")
set.isfname:append("@-@")

set.conceallevel = 2
