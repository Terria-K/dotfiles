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
    "seblyng/roslyn.nvim",
    opts = {}
  }
}
return plugins
