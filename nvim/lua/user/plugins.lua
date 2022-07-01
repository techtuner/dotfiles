local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
--[=====[ 
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
--]=====]

-- Plugins
return packer.startup(function(use)

    -- Add Plugins using the format `use "user/repo"`

    use "wbthomason/packer.nvim" -- Have packer manage itself 
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "kyazdani42/nvim-web-devicons" -- File Icons
    use "kyazdani42/nvim-tree.lua" -- 
    use "nvim-lualine/lualine.nvim" -- status line
    use "numToStr/Comment.nvim" -- To comment
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- Markdown Preview
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        cmd = 'MarkdownPreview'
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    use 'tjdevries/colorbuddy.nvim'
    use 'luisiacc/gruvbox-baby'
    use 'tribela/vim-transparent'
    use 'ray-x/go.nvim'
    use 'pangloss/vim-javascript'
    use 'mxw/vim-jsx'
    use 'rust-lang/rust.vim'
    use 'darrikonn/vim-gofmt'
    use 'phaazon/hop.nvim'
    use 'ryanoasis/vim-devicons'
    use {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('crates').setup()
    end,
}

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
