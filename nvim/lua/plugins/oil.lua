return {
  "stevearc/oil.nvim",
  dependencies = { "echasnovski/mini.nvim", "nvim-tree/nvim-web-devicons" },
  config       = function()
    require("oil").setup({
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["_"] = "action.open_cwd",
        ["`"] = "actions.cd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden"
      },
      use_default_keymaps = false,
      default_file_explorer = true,
      columns = {
        "icons"
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        natural_order = true,
        case_sensitive = false,
      },
      float = {

        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded"
      }
    })
  end
}
