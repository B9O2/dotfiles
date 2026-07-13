local function find_files_current_dir()
  local cwd = nil
  if vim.bo.filetype == 'oil' then
    cwd = require('oil').get_current_dir()
  else
    cwd = vim.fn.expand '%:p:h'
    if cwd == '' or vim.fn.isdirectory(cwd) == 0 then
      cwd = vim.loop.cwd()
    end
  end
  Snacks.picker.files {
    cwd = cwd,
    title = 'Find Files (' .. vim.fn.fnamemodify(cwd, ':~') .. ')',
  }
end

local function find_files_project()
  local cwd = vim.loop.cwd()
  Snacks.picker.files { title = 'Project Files (' .. vim.fn.fnamemodify(cwd, ':~') .. ')' }
end

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
      main = { current = true },
      layout = { preset = 'ivy', preview = 'main' },
      formatters = {
        file = { filename_first = true },
      },
      sources = {
        projects = {
          format = function(item, picker)
            local path = item.file or item.text or ""
            -- get the directory name (project name)
            local name = vim.fn.fnamemodify(path, ":t")
            if name == "" then
              path = path:gsub("/$", "")
              name = vim.fn.fnamemodify(path, ":t")
            end
            -- get the parent path
            local dir = vim.fn.fnamemodify(path, ":h")
            
            local ret = {}
            local icon = picker.opts.icons.files.dir_open or ""
            ret[#ret + 1] = { icon .. " ", "SnacksPickerDirectory", virtual = true }
            ret[#ret + 1] = { name, "SnacksPickerFile" }
            ret[#ret + 1] = { " " }
            ret[#ret + 1] = { dir, "SnacksPickerDir" }
            return ret
          end,
        },
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
      find_files_current_dir,
      desc = 'Find files (SPC .)',
    },
    {
      '<leader><leader>',
      find_files_project,
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
      '<leader>ff',
      find_files_current_dir,
      desc = '[F]ind [F]iles (Current Dir)',
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
        local cwd = vim.loop.cwd()
        Snacks.picker.files { title = 'Project Files (' .. vim.fn.fnamemodify(cwd, ':~') .. ')' }
      end,
      desc = '[P]roject [F]iles',
    },
    {
      '<leader>ps',
      function()
        local cwd = vim.loop.cwd()
        Snacks.picker.grep { title = 'Project Search (' .. vim.fn.fnamemodify(cwd, ':~') .. ')' }
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
