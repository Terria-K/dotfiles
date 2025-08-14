local plugins = {
  {"Decodetalkers/csharpls-extended-lsp.nvim"},
  {"roxma/vim-tmux-clipboard"},

  {
    "vigoux/notifier.nvim",
    config = function ()
      require("notifier").setup()
    end
  },
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
}
return plugins
