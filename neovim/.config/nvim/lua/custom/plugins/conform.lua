return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      go = { 'goimports', 'golines' },
    },
    formatters = {
      golines = {
        args = { '-m', '80' },
      },
    },
  },
}
