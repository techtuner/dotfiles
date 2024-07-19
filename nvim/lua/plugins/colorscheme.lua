return {
 "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require("cyberdream").setup({
      transparent = true,
      italic_comment = true,
      borderless_telescope = true,
      theme = {variant = "default"},
      extensions = {
        telescope = true,
      }
    })
    vim.cmd("colorscheme cyberdream")
  end
}
