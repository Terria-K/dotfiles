return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local user = require("user." .. User)

      require("nvim-treesitter.configs").setup({
        ensure_installed = user.syntax,
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
        },
        refactor = {
          highlight_definitions = {
            enable = true,
          },
          smart_rename = {
            enable = false,
          },
        },
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  }
}


