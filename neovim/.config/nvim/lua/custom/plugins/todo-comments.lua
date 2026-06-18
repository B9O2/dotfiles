return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false,
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*[^:]*:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\s*[^:]*:]],
    },
    keywords = {
      PROBLEM = {
        icon = "?",
        color = "#E0AF68",
        alt = { "Problem" },
      },
      LEVEL = {
        icon = "*",
        color = "#E0AF68",
        alt = { "Difficulty level" },
      },
    },
  },
}
