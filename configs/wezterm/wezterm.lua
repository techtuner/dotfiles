local wezterm = require 'wezterm'

local config = {}

-- Font
config.font = wezterm.font_with_fallback({
  "SFMono Nerd Font",
})
config.font_size = 14.0
config.line_height = 1.25

config.colors = {
  foreground = "#D4BE98",
  background = "#171C1B",
  cursor_bg = "#D4BE98",
  cursor_border = "#D4BE98",
  cursor_fg = "#171C1B",
  selection_bg = "#32302F",
  selection_fg = "#D4BE98",

  ansi = {
    "#141617",
    "#EA6962",
    "#A9B665",
    "#D8A657",
    "#7DAEA3",
    "#D3869B",
    "#89B482",
    "#DDC7A1",
  },

  brights = {
    "#504945",
    "#EA6962",
    "#A9B665",
    "#D8A657",
    "#7DAEA3",
    "#D3869B",
    "#89B482",
    "#DDC7A1",
  },

  -- Extra Gruvbox Material shades for consistency (can be used in overrides)
  indexed = {
    [16] = "#32302F",
    [17] = "#3C3836",
    [18] = "#442E2D",
    [19] = "#333E34",
    [20] = "#2E3B3B",
    [21] = "#473C29",
    [22] = "#3C333B",
    [23] = "#3C1F1E",
    [24] = "#32361A",
    [25] = "#0D3138",
    [26] = "#7C6F64",
    [27] = "#928374",
    [28] = "#A89984",
  },
}

-- Window appearance
config.window_background_opacity = 0.95
config.macos_window_background_blur = 25 -- Works on macOS; ignored elsewhere
config.window_decorations = "TITLE | RESIZE"
config.audible_bell = "Disabled"

-- Tab bar settings
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

return config
