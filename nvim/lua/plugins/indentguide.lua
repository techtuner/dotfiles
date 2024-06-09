return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = false,
  version = "2.1.0",
  config = function()
    require("indent-blankline").setup({
      char = "┊",
      filetype_exclude = { "help", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false

    })
  end
}
