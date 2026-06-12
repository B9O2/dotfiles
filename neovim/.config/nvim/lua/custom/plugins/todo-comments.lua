return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*[^:]*:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\s*[^:]*:]],
    },
    -- Problem #1: bb
    -- PROBLEM: aa
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
