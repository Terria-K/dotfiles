return {
  "gelguy/wilder.nvim",
  config = function()
    local wilder = require("wilder")

    wilder.setup({
        modes = {
            ":", "/", "?",
        },
    })

    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        highlights = {
          border = "Normal",
        },
        pumblend = 20,
        border = "rounded",
      }))
    )
  end,
}
