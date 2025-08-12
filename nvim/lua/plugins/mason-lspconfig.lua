return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function ()
      local user = require("user." .. User)
      require("mason-lspconfig").setup({
        ensure_installed = user.lsp.servers
      })
    end
}
