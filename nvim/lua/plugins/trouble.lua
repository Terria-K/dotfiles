return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    }
  },
  config = function ()
    local trouble = require("trouble")
    trouble.setup({})

    vim.keymap.set('n', "[d", function ()
      if not trouble.is_open() then
        vim.cmd("Trouble diagnostics toggle")
      end
      trouble.prev({ new = false, skip_groups = true, jump = true})
    end)

    vim.keymap.set('n', "]d", function ()
      if not trouble.is_open() then
        vim.cmd("Trouble diagnostics toggle")
      end
      trouble.next({ new = false, skip_groups = true, jump = true})
    end)
  end
}
