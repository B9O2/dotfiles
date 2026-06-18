return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bash", "c", "cpp", "diff", "html", "lua", "luadoc", "markdown",
      "markdown_inline", "query", "vim", "vimdoc", "go", "gomod", "gowork", "gosum", "nix"
    }
    pcall(function()
      require("nvim-treesitter").install(parsers)
    end)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
        vim.wo.foldenable = false
      end,
    })
  end,
}
