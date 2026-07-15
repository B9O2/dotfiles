return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-go")({
          args = { "-v" },
        }),
      },
    })
    
    -- Map 'q' to close neotest windows
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "neotest-output", "neotest-summary", "neotest-output-panel" },
      callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
      end,
    })
  end,
  keys = {
    { "<leader>Tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
    { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
    {
      "<leader>To",
      function()
        require("neotest").output_panel.toggle()
        vim.defer_fn(function()
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "neotest-output-panel" then
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end, 10)
      end,
      desc = "Toggle test output panel",
    },
    {
      "<leader>Tv",
      function()
        require("neotest").output.open({ enter = true, auto_close = true })
      end,
      desc = "View test output (float)",
    },
    { "<leader>Ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
  },
}
