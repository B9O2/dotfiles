return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>sr',
      function()
        require('spectre').open()
      end,
      desc = '[S]earch and [R]eplace (Spectre)',
    },
  },
  opts = {
    -- You can configure spectre here if needed, but defaults are good
    -- For example, to open in a vertical split:
    -- open_in_split = 'vertical',
  },
}
