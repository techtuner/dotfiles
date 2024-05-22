return{
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("trouble").setup({
      icons = true,
      mode = "workspace_diagnostics",
      signs = {
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
      },
      use_diagnostic_signs = true
    })
  end
}
