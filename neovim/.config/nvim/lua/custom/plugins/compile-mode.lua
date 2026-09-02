return {
  'ej-shafran/compile-mode.nvim',
  -- recommended to lock to a stable version
  version = '^5.0.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- ANSI escape code support for colored output
    { 'm00qek/baleia.nvim', tag = 'v1.3.0', submodules = false },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      baleia_setup = true, -- enable colored output
      input_word_completion = true, -- fix tab completion duplicating text
      default_command = '', -- default to empty instead of 'make -k'
      focus_compilation_buffer = true, -- auto-focus output window
    }

    local root_markers = {
      '.git',
      'go.mod',
      'Cargo.toml',
      'package.json',
      'pyproject.toml',
      'Makefile',
      'CMakeLists.txt',
      'compile_commands.json',
    }

    local function compile_root()
      local bufname = vim.api.nvim_buf_get_name(0)
      local start = bufname ~= '' and bufname or vim.fn.getcwd()
      return vim.fs.root(start, root_markers) or vim.fn.getcwd()
    end

    vim.api.nvim_create_user_command('CompileProject', function()
      vim.g.compilation_directory = compile_root()
      vim.cmd.Compile()
    end, {})
  end,
  keys = {
    { '<leader>cc', '<cmd>CompileProject<cr>', desc = 'Compile project' },
  },
}
