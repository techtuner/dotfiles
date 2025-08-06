local set = vim.opt

set.inccommand = "split"

set.number = true
set.relativenumber = true

set.mouse = "a"

set.smartcase = true
set.ignorecase = true

set.splitbelow = true
set.splitright = true

set.shada = { "'10", "<0", "s10", "h" }

set.swapfile = false
set.backup = false
set.undofile = true

-- set.formatoptions:remove "o"

set.wrap = true
set.linebreak = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

set.more = false

set.title = true
set.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

set.clipboard = "unnamedplus"

set.background = "dark"
set.termguicolors = true

set.completeopt = { "menu", "menuone", "noselect" }
set.shortmess:append "c"

set.showmode = false
set.laststatus = 0

set.updatetime = 250
set.timeoutlen = 300

set.scrolloff = 10
set.sidescrolloff = 10

set.list = true
set.smartindent = true
set.autoindent = true
set.smarttab = true
set.expandtab = true
