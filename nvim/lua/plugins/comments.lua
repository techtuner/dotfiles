---@diagnostic disable: missing-fields
return {
  "numToStr/Comment.nvim",
  event = { "BufEnter" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("ts_context_commentstring").setup({ enable_autocmd = false })
    end,
  },
  lazy = false,
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      padding = true
    })

    local ft = require("Comment.ft")
    ft.set("reason", { "//%s", "/*%s*/" })
  end
}
