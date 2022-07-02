-- Initial Options for neovim
local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = {"menuone","noselect"},
  mouse = "a",
  ignorecase = true,
  hlsearch = true,
  fileencoding = "utf-8",
  conceallevel = 0,
  pumheight = 10,
  showmode = true,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  autoindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  timeoutlen = 100,
  undofile = true,
  termguicolors = true,
  writebackup = false,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  scrolloff = 100,
  sidescrolloff = 10,
  signcolumn = "yes",
  wrap = false,

}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap +=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.opt.background = "dark"
vim.cmd "colorscheme gruvbox-baby"
