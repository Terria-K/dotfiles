return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      padding = false,
      toggler = {
        line = ".c"
      },

      opleader = {
        line = ".c"
      },

      mappings = {
        basic = true,
        extra = false
      }
    })
  end
}
