return {
  "epwalsh/obsidian.nvim",
  version="*",
  lazy=true,
  ft="markdown",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name="Digital Garden(デジタルガーデン)",
        path="G:\\My Drive\\デジタルガーデン"
      }
    },
    completion = {
      nvim_cmp = true,
      min_chars = 5
    },
    templates = {
      folder = "Templates"
    },
    picker = {
      name = "telescope.nvim"
    }
  }
}
