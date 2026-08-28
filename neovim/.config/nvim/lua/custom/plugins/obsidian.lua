return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- 以下 cmd 让全局快捷键也能触发懒加载
  cmd = {
    'ObsidianOpen',
    'ObsidianNew',
    'ObsidianNewFromTemplate',
    'ObsidianQuickSwitch',
    'ObsidianSearch',
    'ObsidianToday',
    'ObsidianDailies',
    'ObsidianWorkspace',
    'ObsidianTags',
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
    'nvim-lua/plenary.nvim',
    -- see below for full list of optional dependencies 👇
  },
  keys = {
    -- 仅在 markdown 文件内有意义的操作
    { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'List Links in Note' },
    { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Show Backlinks' },
    { '<leader>oi', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste Image' },
    { '<leader>oI', '<cmd>ObsidianLink<cr>', desc = 'Link Selection to Note', mode = 'v' },
    { '<leader>ox', '<cmd>ObsidianToggleCheckbox<cr>', desc = 'Toggle Checkbox' },
    { '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Rename Note' },
  },
  opts = function()
    -- 按需定义所有可能的 vault，运行时只加载实际存在的目录
    local all_workspaces = {
      {
        name = 'work',
        path = '~/vaults/work',
        overrides = {
          daily_notes = { folder = 'Weekly-work', date_format = '%Y-W%V' },
        },
      },
      {
        name = 'notes',
        path = '~/vaults/notes',
        overrides = {
          daily_notes = { folder = 'Weekly', date_format = '%Y-W%V' },
        },
      },
    }

    local workspaces = {}
    for _, ws in ipairs(all_workspaces) do
      if vim.fn.isdirectory(vim.fn.expand(ws.path)) == 1 then
        table.insert(workspaces, ws)
      end
    end

    return {
      picker = { name = 'mini.pick' },
      workspaces = workspaces,
      -- 全局兜底（无匹配 workspace 时生效）
      daily_notes = {
        folder = 'Weekly',
        date_format = '%Y-W%V',
      },
    }
  end,
}
