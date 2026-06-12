return {
  "leoluz/nvim-dap-go",
  ft = "go",
  opts = {
    delve = {
      --- 不启用编译器优化
      build_flags = "-gcflags='all=-N -l'",
    },
  },
}
