return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = {
      enabled = true,
      layout = { preset = 'ivy', preview = 'main' },
      sources = {
        files = {
          hidden = true,
          ignored = true,
          transform = function(item)
            if item.file and (item.file:match '^%.' or item.file:match '/%.') then
              item.hidden = true
            end
            if item.file and (item.file:match 'node_modules/' or item.file:match 'target/') then
              item.ignored = true
            end
            return item
          end,
        },
        grep = {
          hidden = true,
          ignored = true,
          transform = function(item)
            if item.file and (item.file:match '^%.' or item.file:match '/%.') then
              item.hidden = true
            end
            if item.file and (item.file:match 'node_modules/' or item.file:match 'target/') then
              item.ignored = true
            end
            return item
          end,
        },
      },
    },
    notifier = { enabled = true },
  },
  keys = {
    {
      '<leader>.',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find files (SPC .)',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find files (SPC SPC)',
    },
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Switch buffers (SPC ,)',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Delete Other Buffers',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'Toggle Explorer',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = '[F]ind [F]iles',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.grep()
      end,
      desc = '[S]earch [P]roject (Grep)',
    },
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<leader>n',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>hh',
      function()
        Snacks.picker.help()
      end,
      desc = '[H]elp Pages',
    },
    {
      '<leader>hk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = '[H]elp [K]eymaps',
    },
    {
      '<leader>ht',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = '[H]elp [T]heme (Colorschemes)',
    },
    {
      '<leader>hm',
      function()
        Snacks.picker.man()
      end,
      desc = '[H]elp [M]an Pages',
    },
    {
      '<leader>hc',
      function()
        Snacks.picker.commands()
      end,
      desc = '[H]elp [C]ommands',
    },
    {
      '<leader>sP',
      function()
        Snacks.picker.pickers()
      end,
      desc = '[S]earch [P]ickers',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = '[S]earch [S]ymbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = '[S]earch Workspace [S]ymbols',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent()
      end,
      desc = '[F]ind [R]ecent Files',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[F]ind [C]onfig files',
    },
    {
      '<leader>pp',
      function()
        Snacks.picker.projects()
      end,
      desc = '[P]roject switch/projects',
    },
    {
      '<leader>pf',
      function()
        Snacks.picker.files()
      end,
      desc = '[P]roject [F]iles',
    },
    {
      '<leader>ps',
      function()
        Snacks.picker.grep()
      end,
      desc = '[P]roject [S]earch (grep)',
    },
    {
      '<leader>sb',
      function()
        Snacks.picker.lines()
      end,
      desc = '[S]earch [B]uffer lines',
    },
  },
}

