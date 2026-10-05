 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#121318',
    base01 = '#1f1f25',
    base02 = '#292a2f',
    base03 = '#90909a',
    base04 = '#c6c5d0',
    base05 = '#e3e1e9',
    base06 = '#e3e1e9',
    base07 = '#e3e1e9',
    base08 = '#ffb4ab',
    base09 = '#e4bad9',
    base0A = '#c2c5dd',
    base0B = '#b8c4ff',
    base0C = '#e4bad9',
    base0D = '#b8c4ff',
    base0E = '#c2c5dd',
    base0F = '#dfe1f9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e3e1e9',          bg = '#121318' })
  hi('TelescopeBorder',         { fg = '#90909a',             bg = '#121318' })
  hi('TelescopePromptNormal',   { fg = '#e3e1e9',          bg = '#121318' })
  hi('TelescopePromptBorder',   { fg = '#90909a',             bg = '#121318' })
  hi('TelescopePromptPrefix',   { fg = '#b8c4ff',             bg = '#121318' })
  hi('TelescopePromptCounter',  { fg = '#c6c5d0',  bg = '#121318' })
  hi('TelescopePromptTitle',    { fg = '#121318',             bg = '#b8c4ff' })
  hi('TelescopePreviewTitle',   { fg = '#121318',             bg = '#c2c5dd' })
  hi('TelescopeResultsTitle',   { fg = '#121318',             bg = '#e4bad9' })
  hi('TelescopeSelection',      { fg = '#e3e1e9',          bg = '#292a2f' })
  hi('TelescopeSelectionCaret', { fg = '#b8c4ff',             bg = '#292a2f' })
  hi('TelescopeMatching',       { fg = '#b8c4ff',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e3e1e9',          bg = '#121318' })
  hi('MiniPickBorder',         { fg = '#90909a',             bg = '#121318' })
  hi('MiniPickPrompt',   { fg = '#e3e1e9',          bg = '#121318' })
  hi('MiniPickPromptPrefix',   { fg = '#b8c4ff',             bg = '#121318' })
  hi('MiniPickBorderText',    { fg = '#121318',             bg = '#b8c4ff' })
  hi('MiniPickMatchCurrent',      { fg = '#e3e1e9',          bg = '#292a2f' })
  hi('MiniPickPromptCaret', { fg = '#b8c4ff',             bg = '#292a2f' })
  hi('MiniPickMatchRanges',       { fg = '#b8c4ff',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
