-- Lsp config

local status_ok, _ = pcal(require,"lspconfig")
if not status_ok then
    return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
