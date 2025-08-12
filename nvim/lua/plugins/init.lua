local plugins = {
  {"Decodetalkers/csharpls-extended-lsp.nvim"},
  {"roxma/vim-tmux-clipboard"},
  {
    "j-hui/fidget.nvim",
    config = function ()
      require("fidget").setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        line_mapping = "<C-/>",
        operator_mapping = ",",
      })
    end
  },


  {"onsails/lspkind.nvim"},

  {"kyazdani42/nvim-web-devicons", lazy = true},
  {"andweeb/presence.nvim"},

  {"windwp/nvim-ts-autotag"},
  {"lukas-reineke/indent-blankline.nvim"},

  {"svermeulen/vimpeccable"},
}

return plugins
