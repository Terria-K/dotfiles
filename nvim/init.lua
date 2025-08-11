-- Configurations --
-- Specify the user to know what user configurations to choose from
-- Choose the theme you like, or use other ones aswell
User = "terria"


-- Internals
local user_cfg = require("user." .. User)

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

-- Setup lazy.nvim
require("lazy").setup({
  { import = "plugins" }
},
{
  change_detection = {
    notify = false
  }
})

-- Override the theme --
if user_cfg.theme ~= nil then
  local ok, theme = pcall(require, user_cfg.theme)
  if ok then
    theme.load()
  end
end

