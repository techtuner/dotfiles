return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
      },
      notify_on_error = true,
      notify_no_formatters = true,
      default_format_opts = {
        async = true,
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      format_after_save = {
        async = true,
        timeout_ms = 500,
        lsp_format = "fallback"
      }
    })
  end
}
