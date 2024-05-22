return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {"rafamadriz/friendly-snippets"},
  config = function()
    local ls = require("luasnip")
    ls.filetype_extend("javascript", {"jsdoc"})
    local keymap = vim.keymap.set
    local opts = {silent = true}
    keymap({"i"}, "<C-s>e", function() ls.expand() end, opts)
    keymap({"i","s"}, "<C-Up>", function () ls.jump(1) end, opts)
    keymap({"i","s"}, "<C-Down>", function () ls.jump(-1) end, opts)
    keymap({"i","s"}, "<CR>", function ()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, opts)
  end
}
