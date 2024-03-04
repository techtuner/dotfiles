return{
  "epwalsh/obsidian.nvim",
  version = "*",
  file_type = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config=function ()
    require("obsidian").setup({
      workspaces = {
        {name = "KnowledgeBase",
        path = "~/workspace/Notes/KnowledgeBase"
      }
      },
    completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
    })
  end
}
