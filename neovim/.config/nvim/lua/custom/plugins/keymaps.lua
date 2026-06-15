local map = vim.keymap.set

-- ============================================================================
-- 1. YOUR CUSTOM KEYMAPS (from ~/.config/nvim/lua/config/keymaps.lua)
-- ============================================================================

-- Which-key groups (wrapped in pcall in case which-key loads later)
pcall(function()
  local wk = require 'which-key'
  wk.add {
    { '<leader>g', group = 'git', icon = { icon = '', color = 'orange' } },
    { '<leader>gh', group = 'hunks' },
    { '<leader>m', group = 'marks', icon = { icon = '󰃀' } },
    { '<leader>w', group = 'windows', icon = { icon = '' } },
  }
end)

map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('v', 'd', '"_d')

map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('v', 'c', '"_c')

map('n', 'q', '<Nop>', { desc = 'Disable macro recording' })

map('n', '<leader>\\', '<cmd>vsplit<cr>', { desc = 'Split window right' })

-- Safe deletion of potentially unset keymaps
pcall(function()
  vim.keymap.del('n', 'H')
end)
pcall(function()
  vim.keymap.del('n', 'L')
end)
pcall(function()
  vim.keymap.del('n', '<C-f>')
end)

-- Marks
map('n', '<leader>md', function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local marks = vim.fn.getmarklist '%'
  local marks_to_delete = {}
  for _, mark in ipairs(marks) do
    if mark.pos[2] == line and mark.mark:match "^'[a-z]$" then
      table.insert(marks_to_delete, mark.mark:sub(2))
    end
  end
  if #marks_to_delete > 0 then
    vim.cmd('delmarks ' .. table.concat(marks_to_delete, ''))
    vim.notify('Deleted marks: ' .. table.concat(marks_to_delete, ', '))
  else
    vim.notify 'No marks on current line'
  end
end, { desc = 'Delete marks on current line' })

map('n', '<leader>mo', function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local marks = vim.fn.getmarklist '%'
  local marks_to_delete = {}
  for _, mark in ipairs(marks) do
    if mark.pos[2] ~= line and mark.mark:match "^'[a-z]$" then
      table.insert(marks_to_delete, mark.mark:sub(2))
    end
  end
  if #marks_to_delete > 0 then
    vim.cmd('delmarks ' .. table.concat(marks_to_delete, ''))
    vim.notify('Deleted ' .. #marks_to_delete .. ' marks (kept current line)')
  else
    vim.notify 'No other marks to delete'
  end
end, { desc = 'Delete all marks except current line' })

-- ============================================================================
-- 2. LAZYVIM DEFAULTS (Adapted for pure Neovim)
-- ============================================================================

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- Clear search, diff update and redraw
map('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'Redraw / Clear hlsearch / Diff Update' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

--keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
map('x', '<', '<gv')
map('x', '>', '>gv')

-- commenting
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- location list
map('n', '<leader>xl', function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = 'Location List' })

-- quickfix list
map('n', '<leader>xq', function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = 'Quickfix List' })

map('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
map('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump {
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    }
  end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- highlights under cursor
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
map('n', '<leader>uI', function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input 'I'
end, { desc = 'Inspect Tree' })

-- windows
map('n', '<leader>wh', function()
  vim.cmd('vertical resize -' .. (vim.v.count1 * 2))
end, { desc = 'Decrease Window Width', remap = true })
map('n', '<leader>wj', function()
  vim.cmd('resize -' .. (vim.v.count1 * 2))
end, { desc = 'Decrease Window Height', remap = true })
map('n', '<leader>wk', function()
  vim.cmd('resize +' .. (vim.v.count1 * 2))
end, { desc = 'Increase Window Height', remap = true })
map('n', '<leader>wl', function()
  vim.cmd('vertical resize +' .. (vim.v.count1 * 2))
end, { desc = 'Increase Window Width', remap = true })
map('n', '<leader>wH', '<C-W>H', { desc = 'Move Window Left', remap = true })
map('n', '<leader>wJ', '<C-W>J', { desc = 'Move Window Down', remap = true })
map('n', '<leader>wK', '<C-W>K', { desc = 'Move Window Up', remap = true })
map('n', '<leader>wL', '<C-W>L', { desc = 'Move Window Right', remap = true })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>w\\', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
map('n', '<leader>ww', '<C-W>p', { desc = 'Other Window', remap = true })

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- ============================================================================
-- 3. SPECIFIC PLUGINS (Telescope Notify)
-- ============================================================================
map('n', '<leader>nn', function()
  require('telescope').load_extension 'notify'
  require('telescope').extensions.notify.notify()
end, { desc = 'View Notification History' })

-- ============================================================================
-- 4. GIT KEYMAPS (Lazygit & Gitsigns)
-- ============================================================================
map('n', '<leader>gg', function()
  require('snacks').lazygit()
end, { desc = 'Lazygit' })
map('n', '<leader>gl', function()
  require('snacks').lazygit.log()
end, { desc = 'Lazygit Log' })
map('n', '<leader>gf', function()
  require('snacks').lazygit.log_file()
end, { desc = 'Lazygit Current File History' })
map('n', '<leader>gb', function()
  require('snacks').git.blame_line()
end, { desc = 'Git Blame Line' })
map('n', '<leader>gB', function()
  require('snacks').gitbrowse()
end, { desc = 'Git Browse' })

pcall(function()
  local gs = require 'gitsigns'
  map('n', ']h', gs.next_hunk, { desc = 'Next Hunk' })
  map('n', '[h', gs.prev_hunk, { desc = 'Prev Hunk' })
  map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage Hunk' })
  map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset Hunk' })
  map('v', '<leader>ghs', function()
    gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
  end, { desc = 'Stage Hunk' })
  map('v', '<leader>ghr', function()
    gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
  end, { desc = 'Reset Hunk' })
  map('n', '<leader>ghS', gs.stage_buffer, { desc = 'Stage Buffer' })
  map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
  map('n', '<leader>ghR', gs.reset_buffer, { desc = 'Reset Buffer' })
  map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview Hunk' })
  map('n', '<leader>ghb', function()
    gs.blame_line { full = true }
  end, { desc = 'Blame Line' })
  map('n', '<leader>ghd', gs.diffthis, { desc = 'Diff This' })
  map('n', '<leader>ghD', function()
    gs.diffthis '~'
  end, { desc = 'Diff This ~' })
end)

return {}
