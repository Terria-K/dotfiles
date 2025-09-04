local plugins = {
  {"Decodetalkers/csharpls-extended-lsp.nvim"},
  {"roxma/vim-tmux-clipboard"},
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  {"onsails/lspkind.nvim"},

  {"kyazdani42/nvim-web-devicons", lazy = true},

  {"windwp/nvim-ts-autotag"},
  {"lukas-reineke/indent-blankline.nvim"},

  {"svermeulen/vimpeccable"},

  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "100"
    }
  },

  {
    "seblyng/roslyn.nvim",
    opts = {}
  }
}
return plugins
