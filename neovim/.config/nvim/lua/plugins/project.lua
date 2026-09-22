return {
  'ahmedkhalf/project.nvim',
  event = 'VeryLazy',
  config = function()
    require('project_nvim').setup {
      -- 自动切换目录的模式
      manual_mode = false,

      -- 探测根目录的方法，按照顺序进行
      -- lsp: 根据当前激活的 LSP 来找根目录
      -- pattern: 根据特定文件/文件夹（如 .git）来找根目录
      detection_methods = { 'lsp', 'pattern' },

      -- pattern 模式下，用来识别根目录的标志性文件/文件夹
      patterns = { '.git', 'Makefile', 'package.json', 'Cargo.toml' },

      silent_chdir = false,

      -- Keep project cwd scoped to the current tab to avoid fighting Oil window-local cwd.
      scope_chdir = 'tab',
    }
  end,
}
