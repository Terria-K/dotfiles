return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function ()
    require("todo-comments").setup({
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      }
    })
  end,

  keys = {
    { "<leader>pt", function () require("snacks").picker.todo_comments() end, desc = "Todo" },
    { "<leader>pT", function () require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" }}) end, desc = "Todo" }
  }
}
