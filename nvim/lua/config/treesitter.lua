require("nvim-treesitter.configs").setup({
  ensure_installed = Rivim.syntax,
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
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
})
