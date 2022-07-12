if has('win32') || has('win64')
	source ~\AppData\Local\nvim\modules\keymaps.vim
	source ~\AppData\Local\nvim\modules\options.vim
	source ~\AppData\Local\nvim\plugs\plugins.vim
	source ~\AppData\Local\nvim\modules\plugins\indent-guide.vim
	source ~\AppData\Local\nvim\modules\plugins\gitsigns.vim
	source ~\AppData\Local\nvim\modules\plugins\lualine.vim
	source ~\AppData\Local\nvim\modules\plugins\telescope.vim
	source ~\AppData\Local\nvim\modules\plugins\nvim-tree.vim
	source ~\AppData\Local\nvim\modules\plugins\cmp.vim
	source ~\AppData\Local\nvim\modules\plugins\comments.vim
	source ~\AppData\Local\nvim\modules\plugins\treesitter.vim
	source ~\AppData\Local\nvim\modules\plugins\lsp.vim
	source ~\AppData\Local\nvim\modules\plugins\autopairs.vim
elif has(unix)
	source ~/.config/nvim/modules/keymaps.vim
	source ~/.config/nvim/modules/options.vim
	source ~/.config/nvim/plugs/plugins.vim
	source ~/.config/nvim/modules/plugins/indent-guide.vim
	source ~/.config/nvim/modules/plugins/gitsigns.vim
	source ~/.config/nvim/modules/plugins/lualine.vim
	source ~/.config/nvim/modules/plugins/telescope.vim
	source ~/.config/nvim/modules/plugins/nvim-tree.vim
	source ~/.config/nvim/modules/plugins/cmp.vim
	source ~/.config/nvim/modules/plugins/comments.vim
	source ~/.config/nvim/modules/plugins/treesitter.vim
	source ~/.config/nvim/modules/plugins/lsp.vim
	source ~/.config/nvim/modules/plugins/autopairs.vim
else
	echo "Doesnot support"
endif
