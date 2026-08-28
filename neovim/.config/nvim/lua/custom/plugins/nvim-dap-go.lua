return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  keys = {
    {
      '<leader>dt',
      function()
        require('dap-go').debug_test()
      end,
      desc = 'Debug: Go Test',
      ft = 'go',
    },
    {
      '<leader>dl',
      function()
        require('dap-go').debug_last()
      end,
      desc = 'Debug: Last Go Test',
      ft = 'go',
    },
  },
  opts = {
    delve = {
      --- 不启用编译器优化
      build_flags = "-gcflags='all=-N -l'",
    },
  },
}
