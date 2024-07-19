vim.g.mapleader = " "
vim.g.localmapleader = " "


local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Move selected line/block of text in visual mode
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("v", "J", ":m '>+1<CR>gv=gv")

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- paste over the highlighted text without yanking it
keymap("v", "p", '"_dp')
keymap("v", "P", '"_dP')

-- Move to the start and the end of the line
keymap({ "n", "x", "o" }, "H", "^", opts)
keymap({ "n", "x", "o" }, "L", "g_", opts)

-- Window Splitting
keymap("n", "<leader>|", "<C-w>v", opts)
keymap("n", "<leader>_", "<C-w>s", opts)
keymap("n", "<leader>=", "<C-w>=", opts)

-- Select all
keymap("n", "<C-a>", "ggVG", opts)

-- Quit Neovim
keymap("n", "<leader>q", ":q!<cr>", opts)
keymap("n", "<leader>w", ":wq<cr>", opts)

-- Ctrl + S to save a file
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)

-- Telescope Plugin
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope grep_string<cr>", opts)
