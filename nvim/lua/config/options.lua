local set                = vim.opt

-- File Encoding
set.fileencoding         = "utf-8"

-- Disable Netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Sidebar Numbering/Relative numbering
set.number               = true
set.relativenumber       = true

-- Searching in Neovim
set.incsearch            = true
set.hlsearch             = true
set.ignorecase           = true --ignore case while searching
set.smartcase            = true

-- Disable backing up file
set.backup               = false
set.writebackup          = false
set.swapfile             = false

-- Neovim uses System clipboard
set.clipboard            = "unnamedplus"

-- Allow the use of mouse in Neovim
set.mouse                = "a"

-- Split the screen to below and right
set.splitbelow           = true
set.splitright           = true

-- Timing in Neovim
set.updatetime           = 100
set.timeoutlen           = 1000

-- Enable Persistent Undo
set.undofile             = true

-- UI settings
set.cmdheight            = 1
set.pumheight            = 10
set.conceallevel         = 1
set.showmode             = false
set.showtabline          = 0
set.termguicolors        = true
set.background           = "dark"
set.numberwidth          = 4
set.scrolloff            = 10
set.sidescrolloff        = 10
set.showcmd              = false
set.laststatus           = 0
set.ruler                = false
set.cursorline           = false
set.title                = true
set.signcolumn           = "yes"

-- Set tab/spaces
set.expandtab            = true
set.shiftwidth           = 2
set.tabstop              = 2
set.softtabstop          = 2

-- Wrap/indent
set.smartindent          = true
set.breakindent          = true
set.wrap                 = true

-- Confirm bchanges before exiting
set.confirm              = true

set.completeopt          = { "menu", "menuone", "noselect" } -- MOstly for cmp

-- Change the character at the end of the buffer
set.fillchars            = { eob = " " }
