local function apply_noctalia_theme()
  local matugen_lua = vim.fn.expand '~/.config/nvim/lua/matugen.lua'

  if vim.fn.filereadable(matugen_lua) == 1 then
    local ok, err = pcall(dofile, matugen_lua)
    if not ok then
      vim.notify('Failed to load Noctalia Neovim theme: ' .. err, vim.log.levels.WARN)
    end
  else
    vim.cmd.colorscheme 'default'
  end
end

local function color_scheme()
  return vim.env.COLOR_SCHEME or 'rose-pine'
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      styles = { transparency = true },
      highlight_groups = {
        -- Dim and italicize hidden and ignored files in Snacks picker
        SnacksPickerPathHidden = { fg = 'subtle', italic = true },
        SnacksPickerPathIgnored = { fg = 'subtle', italic = true },
      },
    },
    config = function(_, opts)
      require('rose-pine').setup(opts)
      local scheme = color_scheme()
      if scheme == 'Default' then
        apply_noctalia_theme()
      elseif scheme == 'rose-pine' then
        vim.cmd.colorscheme 'rose-pine'
      elseif scheme == 'rose-pine-moon' then
        vim.cmd.colorscheme 'rose-pine-moon'
      elseif scheme == 'rose-pine-dawn' then
        vim.cmd.colorscheme 'rose-pine-dawn'
      elseif scheme ~= 'tokyonight' then
        vim.cmd.colorscheme 'rose-pine'
      end
    end,
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'storm',
      transparent = true,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      if color_scheme() == 'tokyonight' then
        vim.cmd.colorscheme 'tokyonight-storm'
      end
    end,
  },
}
