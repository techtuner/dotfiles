return {
  "sainnhe/gruvbox-material",
  enabled = true,
  priority = 1000,
  config = function()
    -- Gruvbox Material core settings
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_foreground = "mix"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_float_style = "bright"
    vim.g.gruvbox_material_statusline_style = "mix"
    vim.g.gruvbox_material_cursor = "auto"

    -- Custom background to match screenshot tone
    vim.g.gruvbox_material_colors_override = {
      bg0 = "#16181A", -- deep charcoal black (matches tmux screenshot)
      bg1 = "#1d2021", -- slightly lighter for panels
      bg2 = "#232728", -- for subtle contrast
    }

    -- Load theme
    vim.cmd.colorscheme("gruvbox-material")

    -- Statusline customizations for faint separators look
    vim.api.nvim_set_hl(0, "StatusLine", {
      bg = "#16181A", -- Match background
      fg = "#d4be98", -- Light beige text
      bold = false
    })
    vim.api.nvim_set_hl(0, "StatusLineNC", {
      bg = "#16181A",
      fg = "#665c54", -- Muted separator tone
      bold = false
    })

    -- VertSplit for faint dividers
    vim.api.nvim_set_hl(0, "VertSplit", {
      fg = "#3c3836", -- Faint line color
      bg = "#16181A"
    })

    -- Tabline to blend in
    vim.api.nvim_set_hl(0, "TabLine", {
      bg = "#16181A",
      fg = "#928374"
    })
    vim.api.nvim_set_hl(0, "TabLineSel", {
      bg = "#d79921",
      fg = "#16181A",
      bold = true
    })

    -- WinSeparator for Neovim 0.9+
    pcall(vim.api.nvim_set_hl, 0, "WinSeparator", {
      fg = "#3c3836",
      bg = "#16181A"
    })
  end,
}
