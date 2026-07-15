return {
  "echasnovski/mini.nvim",
  config = function()
    local ai = require("mini.ai")
    ai.setup({
      n_lines = 500,
      custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
      },
    })
    require("mini.surround").setup({
      mappings = {
        add = "<leader>Sa",
        delete = "<leader>Sd",
        find = "<leader>Sf",
        find_left = "<leader>SF",
        highlight = "<leader>Sh",
        replace = "<leader>Sr",
        suffix_last = "l",
        suffix_next = "n",
      },
    })
    local statusline = require("mini.statusline")
    statusline.setup({ use_icons = vim.g.have_nerd_font })
    statusline.section_location = function()
      return "%2l:%-2v"
    end
  end,
}
