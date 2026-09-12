return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'folke/snacks.nvim',
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = {
    search = {},
    options = {
      picker = 'snacks',
    },
  },
}
