local vimp = require("vimp")
local ok, harpoon_ui = pcall(require, "harpoon.ui")

if not ok then
  return
end

vimp.nnoremap("fh", function()
  require("harpoon.mark").add_file()
end)
vimp.nnoremap("gh", function()
  harpoon_ui.toggle_quick_menu()
end)
vimp.nnoremap("<leader>1", function()
  harpoon_ui.nav_file(1)
end)
vimp.nnoremap("<leader>2", function()
  harpoon_ui.nav_file(2)
end)
vimp.nnoremap("<leader>3", function()
  harpoon_ui.nav_file(3)
end)
vimp.nnoremap("<leader>4", function()
  harpoon_ui.nav_file(4)
end)
