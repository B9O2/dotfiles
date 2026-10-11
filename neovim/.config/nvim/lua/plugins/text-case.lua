return {
  'johmsalas/text-case.nvim',
  keys = {
    'ga',
    {
      '<leader>cC',
      function()
        require('textcase').current_word 'to_camel_case'
      end,
      desc = '[C]ase [C]amel case word',
    },
    {
      '<leader>cP',
      function()
        require('textcase').current_word 'to_pascal_case'
      end,
      desc = '[C]ase [P]ascal case word',
    },
  },
  cmd = {
    'Subs',
    'TextCaseStartReplacingCommand',
  },
  config = function()
    require('textcase').setup {}
  end,
}
