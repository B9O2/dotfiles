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
        -- Dim and italicize hidden and ignored files in Snacks picker
        SnacksPickerPathHidden = { fg = "subtle", italic = true },
        SnacksPickerPathIgnored = { fg = "subtle", italic = true },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      local color_scheme = vim.env.COLOR_SCHEME or "rose-pine"
      if color_scheme == "rose-pine" then
        vim.cmd("colorscheme rose-pine-moon")
      elseif color_scheme == "rose-pine-dawn" then
        vim.cmd("colorscheme rose-pine-dawn")
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
      local color_scheme = vim.env.COLOR_SCHEME or "rose-pine"
      if color_scheme == "tokyonight" then
        vim.cmd("colorscheme tokyonight-storm")
      end
    end,
  },
}
