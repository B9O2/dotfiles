return {
  'akinsho/git-conflict.nvim',
  version = '*',
  opts = {
    default_mappings = false,
  },
  keys = {
    { '<leader>gco', '<cmd>GitConflictChooseOurs<cr>', desc = 'Choose Ours' },
    { '<leader>gct', '<cmd>GitConflictChooseTheirs<cr>', desc = 'Choose Theirs' },
    { '<leader>gcb', '<cmd>GitConflictChooseBoth<cr>', desc = 'Choose Both' },
    { '<leader>gc0', '<cmd>GitConflictChooseNone<cr>', desc = 'Choose None' },
    { ']x', '<cmd>GitConflictNextConflict<cr>', desc = 'Next Conflict' },
    { '[x', '<cmd>GitConflictPrevConflict<cr>', desc = 'Prev Conflict' },
  },
}
