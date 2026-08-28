local augroup = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd('VimEnter', {
  group = augroup('custom-startup', { clear = true }),
  callback = function()
    local arg = vim.fn.argv(0) --[[@as string]]

    if vim.fn.argc() == 0 then
      local cwd = vim.fn.getcwd()
      local init_buf = vim.api.nvim_get_current_buf()
      vim.bo[init_buf].bufhidden = 'wipe'
      vim.schedule(function()
        require('oil').open(cwd)
      end)
      return
    end

    local dir
    if arg:match '^oil://' then
      dir = arg:gsub('^oil://', '')
    elseif arg ~= '' and vim.fn.isdirectory(arg) == 1 then
      dir = vim.fn.fnamemodify(arg, ':p')
    end

    if dir and dir ~= '' then
      dir = dir:gsub('/$', '')
      if vim.fn.isdirectory(dir) == 1 then
        vim.cmd('cd ' .. vim.fn.fnameescape(dir))
      end
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup('custom-markdown', { clear = true }),
  pattern = 'markdown',
  callback = function()
    vim.opt_local.conceallevel = 1
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = augroup('custom-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
