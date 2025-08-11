return {
  "SmiteshP/nvim-navic",
  requires = "neovim/nvim-lspconfig",
  config = function()
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
}
