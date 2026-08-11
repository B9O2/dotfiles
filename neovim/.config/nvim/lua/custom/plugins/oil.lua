return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'permissions',
        'size',
        'mtime',
        'icon',
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-v>'] = 'actions.select_vsplit',
        ['<C-s>'] = false,
        ['<C-h>'] = false,
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = false,
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
    }

    -- You can also use '-' to open the parent directory
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- dashboard buffer 会屏蔽全局 keymap，单独为它注册 buffer-local 的 -
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dashboard',
      callback = function(ev)
        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { buffer = ev.buf, desc = 'Open parent directory' })
      end,
    })

    -- 进入 oil buffer 时自动将窗口 cwd 切换到当前目录
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'oil://*',
      callback = function()
        local dir = require('oil').get_current_dir()
        if dir then
          vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
        end
      end,
    })
  end,
}
