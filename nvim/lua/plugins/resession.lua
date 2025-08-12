return {
  "stevearc/resession.nvim",
  config = function ()
    local resession = require("resession")
    resession.setup({})

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function ()
        if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
          resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
        end
      end,
      nested = true
    })

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function ()
        resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
      end
    })

    vim.api.nvim_create_autocmd("StdinReadPre", {
      callback = function ()
        vim.g.using_stdin = true
      end
    })
  end
}
