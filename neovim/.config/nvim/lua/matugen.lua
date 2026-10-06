 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#fbf8ff',
    base01 = '#efedf4',
    base02 = '#e9e7ef',
    base03 = '#767680',
    base04 = '#45464f',
    base05 = '#1b1b21',
    base06 = '#1b1b21',
    base07 = '#1b1b21',
    base08 = '#ba1a1a',
    base09 = '#76546e',
    base0A = '#5a5d72',
    base0B = '#4f5b92',
    base0C = '#e4bad9',
    base0D = '#b8c4ff',
    base0E = '#c2c5dd',
    base0F = '#dfe1f9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#1b1b21',          bg = '#fbf8ff' })
  hi('TelescopeBorder',         { fg = '#767680',             bg = '#fbf8ff' })
  hi('TelescopePromptNormal',   { fg = '#1b1b21',          bg = '#fbf8ff' })
  hi('TelescopePromptBorder',   { fg = '#767680',             bg = '#fbf8ff' })
  hi('TelescopePromptPrefix',   { fg = '#4f5b92',             bg = '#fbf8ff' })
  hi('TelescopePromptCounter',  { fg = '#45464f',  bg = '#fbf8ff' })
  hi('TelescopePromptTitle',    { fg = '#fbf8ff',             bg = '#4f5b92' })
  hi('TelescopePreviewTitle',   { fg = '#fbf8ff',             bg = '#5a5d72' })
  hi('TelescopeResultsTitle',   { fg = '#fbf8ff',             bg = '#76546e' })
  hi('TelescopeSelection',      { fg = '#1b1b21',          bg = '#e9e7ef' })
  hi('TelescopeSelectionCaret', { fg = '#4f5b92',             bg = '#e9e7ef' })
  hi('TelescopeMatching',       { fg = '#4f5b92',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#1b1b21',          bg = '#fbf8ff' })
  hi('MiniPickBorder',         { fg = '#767680',             bg = '#fbf8ff' })
  hi('MiniPickPrompt',   { fg = '#1b1b21',          bg = '#fbf8ff' })
  hi('MiniPickPromptPrefix',   { fg = '#4f5b92',             bg = '#fbf8ff' })
  hi('MiniPickBorderText',    { fg = '#fbf8ff',             bg = '#4f5b92' })
  hi('MiniPickMatchCurrent',      { fg = '#1b1b21',          bg = '#e9e7ef' })
  hi('MiniPickPromptCaret', { fg = '#4f5b92',             bg = '#e9e7ef' })
  hi('MiniPickMatchRanges',       { fg = '#4f5b92',             bold = true })
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
