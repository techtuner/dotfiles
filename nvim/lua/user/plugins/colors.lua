function Colors(color)
  color = color or "solarized-osaka"

  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "kvrohit/substrata.nvim",
    config = function()
      vim.g.substrata_transparent = true
      Colors()
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
        terminal_colors = true,
      })
      Colors()
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
      })
      Colors()
    end
  }
}
