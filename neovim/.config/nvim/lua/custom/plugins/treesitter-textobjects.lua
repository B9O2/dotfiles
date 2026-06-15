return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")

    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })

    local function safe_select(query)
      return function()
        pcall(select.select_textobject, query, "textobjects")
      end
    end

    local function safe_move(func, query)
      return function()
        pcall(func, query, "textobjects")
      end
    end

    -- Select
    vim.keymap.set({ "x", "o" }, "af", safe_select("@function.outer"), { desc = "Select outer function" })
    vim.keymap.set({ "x", "o" }, "if", safe_select("@function.inner"), { desc = "Select inner function" })
    vim.keymap.set({ "x", "o" }, "ai", safe_select("@conditional.outer"), { desc = "Select outer conditional" })
    vim.keymap.set({ "x", "o" }, "ii", safe_select("@conditional.inner"), { desc = "Select inner conditional" })
    vim.keymap.set({ "x", "o" }, "ac", safe_select("@class.outer"), { desc = "Select outer class" })
    vim.keymap.set({ "x", "o" }, "ic", safe_select("@class.inner"), { desc = "Select inner class" })
    vim.keymap.set({ "x", "o" }, "ab", safe_select("@block.outer"), { desc = "Select outer block" })
    vim.keymap.set({ "x", "o" }, "ib", safe_select("@block.inner"), { desc = "Select inner block" })

    -- Move next start
    vim.keymap.set({ "n", "x", "o" }, "]f", safe_move(move.goto_next_start, "@function.outer"), { desc = "Next function start" })
    vim.keymap.set({ "n", "x", "o" }, "]i", safe_move(move.goto_next_start, "@conditional.outer"), { desc = "Next conditional start" })
    vim.keymap.set({ "n", "x", "o" }, "]c", safe_move(move.goto_next_start, "@class.outer"), { desc = "Next class start" })
    vim.keymap.set({ "n", "x", "o" }, "]b", safe_move(move.goto_next_start, "@block.outer"), { desc = "Next block start" })

    -- Move next end
    vim.keymap.set({ "n", "x", "o" }, "]F", safe_move(move.goto_next_end, "@function.outer"), { desc = "Next function end" })
    vim.keymap.set({ "n", "x", "o" }, "]I", safe_move(move.goto_next_end, "@conditional.outer"), { desc = "Next conditional end" })
    vim.keymap.set({ "n", "x", "o" }, "]C", safe_move(move.goto_next_end, "@class.outer"), { desc = "Next class end" })
    vim.keymap.set({ "n", "x", "o" }, "]B", safe_move(move.goto_next_end, "@block.outer"), { desc = "Next block end" })

    -- Move previous start
    vim.keymap.set({ "n", "x", "o" }, "[f", safe_move(move.goto_previous_start, "@function.outer"), { desc = "Prev function start" })
    vim.keymap.set({ "n", "x", "o" }, "[i", safe_move(move.goto_previous_start, "@conditional.outer"), { desc = "Prev conditional start" })
    vim.keymap.set({ "n", "x", "o" }, "[c", safe_move(move.goto_previous_start, "@class.outer"), { desc = "Prev class start" })
    vim.keymap.set({ "n", "x", "o" }, "[b", safe_move(move.goto_previous_start, "@block.outer"), { desc = "Prev block start" })

    -- Move previous end
    vim.keymap.set({ "n", "x", "o" }, "[F", safe_move(move.goto_previous_end, "@function.outer"), { desc = "Prev function end" })
    vim.keymap.set({ "n", "x", "o" }, "[I", safe_move(move.goto_previous_end, "@conditional.outer"), { desc = "Prev conditional end" })
    vim.keymap.set({ "n", "x", "o" }, "[C", safe_move(move.goto_previous_end, "@class.outer"), { desc = "Prev class end" })
    vim.keymap.set({ "n", "x", "o" }, "[B", safe_move(move.goto_previous_end, "@block.outer"), { desc = "Prev block end" })
  end,
}
