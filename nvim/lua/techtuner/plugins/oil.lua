return{
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
      },
     keymaps = {
      ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      delete_to_trash = true,
      show_hideen = true,
      is_hiden_file = function (name, bufnr)
        return vim.startswith(name, ".")
      end,

    })
    local keymap = vim.keymap.set
    local opts = {silent = true}
    keymap("n", "-", ":Oil<cr>", opts, {desc = "Open parent directory"})
    keymap("n", "<leader>-", require("oil").toggle_float, opts, {desc = "Open parent directory in floatig mode"})
  end
}
