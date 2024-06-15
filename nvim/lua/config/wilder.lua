local ok, wilder = pcall(require, "wilder")
if not ok then
  return
end
-- stylua: ignore
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
