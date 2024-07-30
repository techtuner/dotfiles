vim.g.mapleader = " "
vim.g.localmapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- U to redo
keymap("n", "U", "<C-r>", opts)


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
keymap("n", ":", ":Telescope cmdline<CR>", opts)

-- Oil Plugins
keymap("n", "-", ":Oil<cr>", opts)
keymap("n", "<leader>e", function()
  require("oil").toggle_float()
end)

-- Harpoon Plugins
keymap("n", "<leader>ho", function()
  require("harpoon.ui").toggle_quick_menu()
end)
keymap("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end)
keymap("n", "<leader>hr", function()
  require("harpoon.mark").rm_file()
end)
keymap("n", "<leader>c", function()
  require("harpoon.mark").clear_all()
end)

-- Diagnostics
keymap("n", "]d", function()
  vim.diagnostic.goto_next({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
keymap("n", "[d", function()
  vim.diagnostic.goto_prev({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
keymap("n", "]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
keymap("n", "[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
keymap("n", "]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
keymap("n", "[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)
