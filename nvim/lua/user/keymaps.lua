-- Custom Keybindings
local opts = {noremap = true, silent = true }

local term_opts = {silent = true }

local keymaps = vim.api.nvim_set_keymap
keymaps("","<Space>", "<Nop>",opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- Window Navigation
keymaps("n","<C-Left>","<C-w>h",opts)
keymaps("n","<C-Down>","<C-w>j",opts)
keymaps("n","<C-Up>","<C-w>k",opts)
keymaps("n","<C-Right>","<C-w>l",opts)


-- Resize Windows
keymaps("n", "<A-Up>", ":resize -2<CR>", opts)
keymaps("n", "<A-Down>", ":resize +2<CR>", opts)
keymaps("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymaps("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymaps("v", "<", "<gv", opts)
keymaps("v", ">", ">gv", opts)

-- Move text up and down
keymaps("v", "<A-j>", ":m .+1<CR>==", opts)
keymaps("v", "<A-k>", ":m .-2<CR>==", opts)
keymaps("v", "p", '"_dP', opts)

keymaps("n","<leader>Y","\"+y",opts)
keymaps("v","<leader>Y","\"+y",opts)

-- Copy full content from one file
keymaps("v","<leader>Y", "gg\"+yG", opts)
keymaps("n","<leader>Y", "gg\"+yG", opts)

-- Saving Files
keymaps("n","<C-s>",":update<CR>",opts)
keymaps("v","<C-s>","<C-C>:update<CR>",opts)
keymaps("i","<C-s>","<C-O>:update<CR>",opts)

-- Navigating and Creating Tabs
keymaps("n","<C-n>",":tabnew<CR>",opts)
keymaps("n","<C-w>",":tabclose<CR>",opts)
keymaps("n","<S-Up>",":tabnext -<CR>",opts)
keymaps("n","<S-Left>",":tabmove -<CR>",opts)
keymaps("n","<S-Down>",":tabnext +<CR>",opts)
keymaps("n","<S-Right>",":tabmove +<CR>",opts)

keymaps("n","<leader>q",":q",opts)
keymaps("n","<leader>w",":wq",opts)

keymaps("n","<leader><CR>",":so %<CR>",opts)
keymaps("v","<leader><CR>",":so %<CR>",opts)

keymaps("n","<leader>ff","<cmd>Telescope find_files<CR>",opts)
keymaps("n","<leader>fg","<cmd>Telescope live_grep<CR>",opts)

keymaps("n","<leader>e","NvimTreeToggle<CR>",opts)
