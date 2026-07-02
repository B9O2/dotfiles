-- Dynamic Theme
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      styles = { transparency = true },
      highlight_groups = {
        Visual = { bg = "rose", fg = "base", inherit = false },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      local color_schema = vim.env.COLOR_SCHEMA or "rose-pine"
      if color_schema == "rose-pine" then
        vim.cmd("colorscheme rose-pine-moon")
      end
    end,
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      local color_schema = vim.env.COLOR_SCHEMA or "rose-pine"
      if color_schema == "tokyonight" then
        vim.cmd("colorscheme tokyonight-storm")
      end
    end,
  },
}
