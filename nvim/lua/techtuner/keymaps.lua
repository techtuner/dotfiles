vim.g.mapleader = " "
vim.g.localmapleader = " "

local keymap = vim.keymap.set
local opts = {silent = true }

-- Quit Neovim
keymap("n", "<leader>q", ":q!<cr>", opts)
keymap("n", "<leader>w", ":wq<cr>", opts)

-- Ctrl + S to save a file
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)

-- Window Splitting
keymap("n", "<leader>|", "<C-w>v", opts)
keymap("n", "<leader>_", "<C-w>s", opts)
keymap("n", "<leader>=", "<C-w>=", opts)

-- Window Navigation
keymap("n", "<C-h>" , "<C-w>h", opts)
keymap("n", "<C-j>" , "<C-w>j", opts)
keymap("n", "<C-k>" , "<C-w>k", opts)
keymap("n", "<C-l>" , "<C-w>l", opts)

-- Move the selected content
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Control the size of the split
keymap("n", "<M-,>", "<C-w>5<", opts)
keymap("n", "<M-.>", "<C-w>5>",opts)
keymap("n", "<M-t>", "<C-w>+",opts)
keymap("n", "<M-s>", "<C-w>-",opts)

-- Ctrl+A to select everything
keymap("n", "<C-a>", "gg<S-v>G",opts )
