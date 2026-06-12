return {
  "mrcjkb/rustaceanvim",
  version = "^7", -- Recommended
  enabled = true,
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        status_notify_level = "error",
      },
    }
  end,
}
