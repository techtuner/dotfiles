function ColorMyPencils(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

--             vim.cmd("colorscheme rose-pine")

            -- ColorMyPencils()
        end
    },
  {
    "techtuner/nord.nvim",
    config = function()
      vim.g.nord_disable_background = true
      ColorMyPencils()
      require('nord').set()
    end
  }

}
