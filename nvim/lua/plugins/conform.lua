return {
  "stevearc/conform.nvim",
  config = function()
  require("conform").setup({
    formatters_by_ft = {
      lua = {"stylua"},
      python = {"isort", "black"},
      rust = {"rustfmt", lsp_format = "fallback"},
      go = {"goimports", "gofmt"},
      javascript = {"prettierd", "prettier", stop_after_first = true},
      ["*"] = {"codespell"},
      ["_"] = {"trim_whitespace"},
    },
    notify_on_error = true,
    notify_no_formatters = true,
    format_on_save = {
      lsp_format = "fallback"
    }
  })
  end
}
