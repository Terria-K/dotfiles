--                      Configuration Table
-- All configuration changes should go inside of a config table

local config = {
  keymap = "default",
  number = "relative",
  theme = "onedark",
  options = {
    expandtab = true,
    smartindent = true,
    tabstop = 4,
    shiftwidth = 4,
  },
  lsp = {
    servers = {
      -- "tsserver",
      "clangd",
      "lua_ls",
      "html",
      "denols",
      "pyright",
      "csharp_ls",
    },
    config = {
      html = {},
    },
  },
  -- This will install a syntax tree from tree sitter plugin
  syntax = {
    "cpp",
    "rust",
    "lua",
    "typescript",
    "tsx",
    "html",
    "gdscript",
    "css",
    "c_sharp",
  },
  -- If PackerSync failed, try :luafile % inside of plugin.lua file
  -- Restart required and needed to sync after changes
  default_plugins = {
    ["andweeb/presence.nvim"] = true,
    ["gelguy/wilder.nvim"] = true,
    ["ThePrimeagen/harpoon"] = true,
  },
  plugins = {
    -- LSP --
    "simrat39/rust-tools.nvim",

    -- Utilities --
    "p00f/nvim-ts-rainbow",
    "terrortylor/nvim-comment",

    -- UI --
    "nvim-lualine/lualine.nvim",
    "navarasu/onedark.nvim",
  },
  plugins_init = {
    lualine = require("user.terria.config.lualine"),
    nvim_comment = {
      line_mapping = ".",
      operator_mapping = ",",
    },
    onedark = {
      style = "darker",
      transparent = true,
    },
    ["rust-tools"] = function()
      local rt = require("rust-tools")
      return {
        tools = {
          inlay_hints = {
            parameter_hints_prefix = "<-  ",
            other_hints_prefix = "=>  ",
          },
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                loadOutDirsFromCheck = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              experimental = {
                procAttrMacros = true,
              },
            },
          },
          on_attach = function(client, bufnr)
            Rivim.lsp.on_attach(client, bufnr)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, {
              buffer = bufnr,
            })
            vim.keymap.set("n", "<space>ca", rt.code_action_group.code_action_group, {
              buffer = bufnr,
            })
          end,
        },
      }
    end,
  },
}

return config
