lua << EOF

require('telescope').setup({

  defaults = {
	   prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_config = {
      vertical = { width = 0.5 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  picker ={
	find_files = { themes = "ivy"}
  },
  extensions = {
      media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg", -- find command (defaults to `fd`)
file_browser = {
      theme = "catppuccin",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
   },

    }

  -- other configuration values here
}})

EOF
