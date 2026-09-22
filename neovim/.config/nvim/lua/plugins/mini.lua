return {
  'echasnovski/mini.nvim',
  config = function()
    local ai = require 'mini.ai'
    ai.setup {
      n_lines = 500,
      custom_textobjects = {
        f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
        c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
        o = ai.gen_spec.treesitter {
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
      },
    }
    require('mini.surround').setup {
      mappings = {
        add = '<leader>Sa',
        delete = '<leader>Sd',
        find = '<leader>Sf',
        find_left = '<leader>SF',
        highlight = '<leader>Sh',
        replace = '<leader>Sr',
        suffix_last = 'l',
        suffix_next = 'n',
      },
    }
    require('mini.notify').setup {
      window = {
        max_width_share = 0.6,
        config = function()
          local has_statusline = vim.o.laststatus > 0
          local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
          return { anchor = 'SW', col = 0, row = vim.o.lines - pad }
        end,
      },
    }
    vim.notify = require('mini.notify').make_notify()
    require('mini.pick').setup()
    vim.keymap.set('x', '<leader>s', ':<C-u>lua MiniSurround.add("visual")<CR>', { desc = 'Surround selection' })
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    local function selection_count()
      local mode = vim.fn.mode()
      if not mode:match '[vVsS\22\19]' then
        return ''
      end

      local ok, region = pcall(vim.fn.getregion, vim.fn.getpos 'v', vim.fn.getpos '.', { type = mode })
      if not ok or not region or #region == 0 then
        return ''
      end

      local chars = 0
      for _, line in ipairs(region) do
        chars = chars + vim.fn.strchars(line)
      end

      if #region > 1 then
        return string.format('%dL %dC', #region, chars)
      end
      return string.format('%dC', chars)
    end

    statusline.section_location = function()
      local selection = selection_count()
      if selection ~= '' then
        return selection .. ' %2l:%-2v'
      end
      return '%2l:%-2v'
    end
  end,
}
