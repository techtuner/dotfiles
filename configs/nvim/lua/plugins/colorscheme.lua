return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
        require("catppuccin").setup({
            flavour = "auto",
            background = {
                dark = "mocha"
            },
            transparent_background = true,
            float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    term_colors = true,
    no_italic = false,
    default_integration = true,
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#242424",
            crust = "#474747",
        }
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
        })
        vim.cmd("colorscheme catppuccin")
    end
}
