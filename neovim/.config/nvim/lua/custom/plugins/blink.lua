return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "folke/lazydev.nvim",
  },
  opts = {
    keymap = { preset = "enter" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
      accept = {
        auto_brackets = { enabled = false },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "lazydev" },
      providers = { lazydev = { module = "lazydev.integrations.blink", score_offset = 100 } },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "lua" },
    signature = { enabled = true },
  },
}
