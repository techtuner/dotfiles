local keymap = vim.keymap.set
local opts = { silent = true }

-- Setting leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Oil Plugins
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
keymap("n", "<leader>-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Ctrl + S to save files
keymap("n", "<C-s>", "<CMD>update<CR>", opts)
keymap("v", "<C-s>", "<C-S> <C-C>:update<CR>", opts)
keymap("i", "<C-s>", "<C-O>:update<CR>", opts)

-- Quiting and Writing
keymap("n", "<leader>q", "<CMD>q!<CR>", opts)
keymap("n", "<leader>w", "<CMD>wq!<CR>", opts)


keymap("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
