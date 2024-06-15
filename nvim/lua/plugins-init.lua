require("impatient")
Rivim = {}
local user_cfg = require("user." .. User)
local plugins_init = user_cfg["plugins_init"]
local keymap = user_cfg.keymap
Rivim.syntax = user_cfg.syntax

require("user.keymap." .. keymap)

require("lsp-config.handler")
require("lsp-config.language-servers")

-- Override default setup --
for key, init in pairs(plugins_init) do
  if type(init) == "function" then
    require(key).setup(init())
  else
    require(key).setup(init)
  end
end

if user_cfg["number"] == "relative" then
  vim.wo.relativenumber = true
  vim.wo.number = true
elseif user_cfg["number"] == "absolute" then
  vim.wo.number = true
else
  vim.wo.number = false
end

vim.o.mouse = "a"

-- Override Vim options --
for key, opt in pairs(user_cfg["options"]) do
  vim.o[key] = opt
end

-- Override the theme --
if user_cfg.theme ~= nil then
  local ok, theme = pcall(require, user_cfg.theme)
  if ok then
    theme.load()
  end
end
