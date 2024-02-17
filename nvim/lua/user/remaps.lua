local keymap = vim.keymap.set
local opts = { silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- splitting of the windows
keymap("n","<leader>sv", "<C-w>v", opts)
keymap("n","<leader>sh", "<C-w>s", opts)
keymap("n","<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx",":close<CR>", opts)

-- Quit Vim
keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("n", "<leader>w", ":wq<CR>", opts)

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Ctrl+S to Save
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)

-- Move the content selected
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")


-- Terminal
keymap("n","<leader>t", ":vsplit | :terminal<cr>", opts)
