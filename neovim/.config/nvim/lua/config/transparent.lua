local M = {}

function M.apply()
  local groups = {
    'Normal',
    'NormalNC',
    'NormalFloat',
    'FloatBorder',
    'SignColumn',
    'EndOfBuffer',
    'LineNr',
    'FoldColumn',
    'TelescopeNormal',
    'TelescopeBorder',
    'TelescopePromptNormal',
    'TelescopePromptBorder',
    'TelescopePromptPrefix',
    'TelescopePromptCounter',
    'MiniPickNormal',
    'MiniPickBorder',
    'MiniPickPrompt',
    'MiniPickPromptPrefix',
  }

  for _, group in ipairs(groups) do
    vim.cmd('highlight ' .. group .. ' guibg=NONE ctermbg=NONE')
  end
end

return M
