lua << EOF

local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup(
 integrations = {
	
	 treesitter = true,
	gitsigns = true,
	cmp = true,
	telescope = true,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
	 }
)


EOF
