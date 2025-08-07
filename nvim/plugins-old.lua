local user_cfg = require("user." .. User)
local default = user_cfg["default_plugins"]

local plugins = {
  -- Plugin Manager --
  ["wbthomason/packer.nvim"] = {},

  -- Optimizer --
  ["lewis6991/impatient.nvim"] = {},

  ["williamboman/mason.nvim"] = {
    config = function()
      require("config.mason")
    end,
  },
  ["neovim/nvim-lspconfig"] = {},
  ["hrsh7th/nvim-cmp"] = {
    config = function()
      require("lsp-config.nvim-cmp-config")
    end,
  },
  ["hrsh7th/cmp-nvim-lsp"] = {},
  ["hrsh7th/cmp-vsnip"] = {},
  ["hrsh7th/vim-vsnip"] = {},
  ["onsails/lspkind.nvim"] = {},
  ["nvim-treesitter/nvim-treesitter"] = {
    config = function()
      require("config.treesitter")
    end,
  },
  ["nvim-treesitter/nvim-treesitter-refactor"] = {
    after = "nvim-treesitter",
  },
  ["SmiteshP/nvim-navic"] = {
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("config.navic")
    end,
  },

  ["mhartington/formatter.nvim"] = {
    config = function()
      require("config.formatter")
    end,
  },
  ["kyazdani42/nvim-web-devicons"] = {},
  ["andweeb/presence.nvim"] = {},
  ["windwp/nvim-ts-autotag"] = {},
  ["jiangmiao/auto-pairs"] = {},
  ["lukas-reineke/indent-blankline.nvim"] = {},
  ["gelguy/wilder.nvim"] = {
    config = function()
      require("config.wilder")
    end,
  },
  ["ThePrimeagen/harpoon"] = {
    config = function()
      require("config.harpoon")
    end,
  },
  ["svermeulen/vimpeccable"] = {},
  ["akinsho/toggleterm.nvim"] = {
    tag = "*",
    config = function()
      require("config.toggleterm")
    end,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_command = 1 ]])
      require("config.neotree")
    end,
  },
}

local ok, packer = pcall(require, "packer")
if ok then
  packer.startup(function(use)
    for key, plugin in pairs(plugins) do
      if default[key] or default[key] == nil then
        table.insert(plugin, key)
        use(plugin)
      end
    end
    for _, plug in ipairs(user_cfg["plugins"]) do
      use(plug)
    end
  end)
end
