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
      input_word_completion = true, -- fix tab completion duplicating text
      default_command = "", -- default to empty instead of 'make -k'
      focus_compilation_buffer = true, -- auto-focus output window
    }
  end,
  keys = {
    { "<leader>cc", "<cmd>Compile<cr>", desc = "Compile (Emacs style)" },
  },
}
