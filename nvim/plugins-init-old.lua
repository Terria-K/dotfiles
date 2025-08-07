local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

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
