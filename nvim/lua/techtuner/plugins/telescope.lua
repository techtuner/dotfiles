return {
  "nvim-telescope/telescope.nvim",
  tags = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("telescope").setup({
      defaults = {
        pickers = {
          find_files = {
            theme = "dropdown"
          }
        },
        extensions = {
          media_files = {
            file_types = {"png", "webp" , "jpg" , "jpeg"},
            find_cmd = "rg"
          },
          file_broser = {
            theme = "theme"
          }
        }
      }
    })
  local builtin = require("telescope.builtin")
  local opts = {silent = true}
  local keymaps = vim.keymap.set

  keymaps("n", "<leader>ff", builtin.find_files, opts)
  keymaps("n", "<leader>fg", builtin.live_grep, opts)
  keymaps("n", "<leader>fh", builtin.help_tags, opts)

require("telescope").load_extension("file_browser")
require("telescope").load_extension("media_files")

  end
}
