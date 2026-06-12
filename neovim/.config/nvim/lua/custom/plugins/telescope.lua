return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    keys = {
      {
        "<leader><space>",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },
    },
  },
}
