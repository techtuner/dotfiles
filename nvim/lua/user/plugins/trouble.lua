return {
  "folke/trouble.nvim",
  config = function ()
    require("trouble").setup({
      position = "bottom",
      icons = true,
      multiline = false,
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
    },
      use_diagnostic_signs = true
    })
   local keymap = vim.keymap.set
     keymap("n", "<leader>tt", function()
                require("trouble").toggle()
            end)
      keymap("n", "[t", function()
          require("trouble").next({skip_groups = true, jump = true});
      end)

      keymap("n", "]t", function()
          require("trouble").previous({skip_groups = true, jump = true});
      end)
  end
}
