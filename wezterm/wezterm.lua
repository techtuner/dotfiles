local wezterm =  require("wezterm")
local config = wezterm.config_builder()
config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBar",
--  color_scheme = 'Nord (Gogh)',
  colors = require("cyberdream"),
  -- font = wezterm.font("DankMono Nerd Font Mono"),
  font = wezterm.font("BerkeleyMono Nerd Font Mono"),
  font_size = 10,
  background = {
    {
      source = {
        File="C:/Users/techt/Pictures/wallpapers/Anime-Lanscape.png"
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness  = 0.25,
      },
      width = "100%",
      height = "100%",
    },
    {
      source = {Color = "#16181a"},
      width = "100%",
      height = "100%",
      opacity = 0.85
    }
  },
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0
  },
default_prog = {
  "pwsh"
},
}

-- config.colors = require("cyberdream")
return config
