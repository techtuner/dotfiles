local wezterm = require "wezterm"

local config = wezterm.config_builder()

-- Wzterm font
config.font = wezterm.font("DankMono Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.colors = require("cyberdream")

config.window_background_opacity = 0.98
return config
