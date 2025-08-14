return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      fromatters_be_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        go = { "goimports", "gofmt" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      format_after_save = {
        lsp_format = "fallback"
      },
      notify_on_error = true,
      notify_no_formatters = true
    })
  end,
}
