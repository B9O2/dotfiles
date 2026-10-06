return { 'RRethy/base16-nvim',
  lazy = false,
  config = function()
    if vim.env.COLOR_SCHEME ~= 'noctalia' then
      return
    end

    local ok, matugen = pcall(require, 'matugen')
    if ok then matugen.setup() end
  end,
}
