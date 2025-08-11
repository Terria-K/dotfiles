return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = true,
      })
    end
  },

  {
    "Mofiqul/vscode.nvim",
    config = function ()
       require("vscode").setup({
        transparent = true,
      })
    end
  }
}


