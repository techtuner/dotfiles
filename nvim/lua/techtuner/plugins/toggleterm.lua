return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    require("toggleterm").setup({
      size = 60,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      autochdir = false,
      shade_terminals = true,
      shading_factor = 10,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      directions = 'float',
      shell = vim.o.shell,
      auto_scroll = true,
      close_on_exit = true
    })
  end
}
