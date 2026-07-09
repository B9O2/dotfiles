return {
  "ej-shafran/compile-mode.nvim",
  -- recommended to lock to a stable version
  version = "^5.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- ANSI escape code support for colored output
    { "m00qek/baleia.nvim", tag = "v1.3.0", submodules = false },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      baleia_setup = true, -- enable colored output
    }
  end,
  keys = {
    { "<leader>cc", "<cmd>Compile<cr>", desc = "Compile (Emacs style)" },
  },
}
