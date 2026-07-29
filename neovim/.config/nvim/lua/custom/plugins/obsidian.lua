return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- 以下 cmd 让全局快捷键也能触发懒加载
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianNewFromTemplate",
    "ObsidianQuickSwitch",
    "ObsidianSearch",
    "ObsidianToday",
    "ObsidianDailies",
    "ObsidianWorkspace",
    "ObsidianTags",
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- see below for full list of optional dependencies 👇
  },
  keys = {
    -- 仅在 markdown 文件内有意义的操作
    { "<leader>ol", "<cmd>ObsidianLinks<cr>",          desc = "List Links in Note" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",      desc = "Show Backlinks" },
    { "<leader>oi", "<cmd>ObsidianPasteImg<cr>",       desc = "Paste Image" },
    { "<leader>oI", "<cmd>ObsidianLink<cr>",           desc = "Link Selection to Note", mode = "v" },
    { "<leader>ox", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle Checkbox" },
    { "<leader>or", "<cmd>ObsidianRename<cr>",         desc = "Rename Note" },
  },
  opts = {
    picker = {},
    workspaces = {
      -- {
      --   name = "personal",
      --   path = "~/vaults/personal",
      -- },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },

    -- see below for full list of options 👇
  },
}
