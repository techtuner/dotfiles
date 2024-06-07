local api = vim.api

-- api.nvim_create_autocmd()
-- No autocomment on new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})


-- Resize the neovim split windows when the terminal is resized
api.nvim_command("autocmd VimResized * wincmd=")

-- Close some of the filetypes using <q>
api.nvim_create_autocmd("FileType", {
group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
pattern = {
   "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
},
callback = function()
vim.bo[event.buf].buflisted = false
vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
end
})
