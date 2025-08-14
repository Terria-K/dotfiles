--                      Configuration Table
-- All configuration changes should go inside of a config table

local config = {
  keymap = "default",
  number = "absolute",
  theme = "vscode",

  options = {
    expandtab = true,
    smartindent = true,
    tabstop = 4,
    shiftwidth = 4,
  },

  lsp = {
    servers = {
      -- "tsserver",
      -- "clangd",
      "lua_ls",
      "astro",
      -- "html",
      -- "denols",
      -- "pyright",
      "csharp_ls",
      --"omnisharp",
    },
    config = {
      html = {},
    },
  },

  dap = {
    adapters = {
      "netcoredbg"
    }
  },

  -- This will install a syntax tree from tree sitter plugin
  syntax = {
    "lua",
    "typescript",
    "tsx",
    "html",
    "css",
    "c_sharp",
    "astro"
  },

  -- If PackerSync failed, try :luafile % inside of plugin.lua file
  -- Restart required and needed to sync after changes
  default_plugins = {
    ["andweeb/presence.nvim"] = true,
    ["gelguy/wilder.nvim"] = true,
    ["ThePrimeagen/harpoon"] = true,
  },

  plugins = {
    -- Utilities --

  }
}

return config
